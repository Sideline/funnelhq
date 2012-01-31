class User
  
  include Core::Mongoid::Document
  
  ROLES = %w(admin client collaborator)

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
    
  ## Validation ##
     
  validates_presence_of :first_name, :last_name
  validates :email, presence: true, uniqueness: true, format: { with: /^[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i }
  
  ## associations ##
  
  embeds_many :projects
  embeds_many :clients
  embeds_many :uploads
  
  ## Attr Accessors ##
  
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :remember_me
  
  ## fields ##
  
  field :first_name
  field :last_name
  field :role, :default => 'admin'
  
  class << self
    
  end
  
  # Returns number of projects for a user
  def number_of_projects
    self.projects.count
  end
  
  # Returns projects created in the last two weeks
  def recent_projects
    self.projects.criteria.and(:updated_at.gt => 2.weeks.ago)
  end
  
  # Returns a users full name
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
  
  # Returns true if user is an admin user
  def admin?
    self.role.downcase == "admin"
  end
    
end
