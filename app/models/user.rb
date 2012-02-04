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
  embeds_many :tasks
  
  ## Attr Accessors ##
  
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :remember_me
  
  ## fields ##
  
  field :first_name
  field :last_name
  field :role, :default => 'admin'
  
  class << self
    
  end
  
  def number_of_projects
    self.projects.count
  end
  
  def recent_projects
    self.projects.criteria.and(:updated_at.gt => 2.weeks.ago)
  end
  
  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def admin?
    self.role.downcase == "admin"
  end
  
  def first_login?
    self.sign_in_count == 1
  end
    
end
