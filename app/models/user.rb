class User
  
  include Core::Mongoid::Document
  
  ROLES = %w(admin client collaborator)

  ## Database authenticatable
  field :email,              :type => String, :null => false
  field :encrypted_password, :type => String, :null => false

  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  field :first_name
  field :last_name
  field :avatar_url
  field :role, :default => 'admin'

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
  
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :remember_me, :avatar_url
  
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
