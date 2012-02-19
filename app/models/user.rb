require "digest/sha1"

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

  field :first_name, :type => String
  field :last_name, :type => String
  field :avatar_url, :type => String
  field :role, :type => String, :default => 'admin'
  field :api_key, :type => String

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
    
  ## Validation ##
     
  validates_presence_of :first_name, :last_name
  validates :email, presence: true, uniqueness: true, format: { with: /^[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i }
  
  ## associations ##
  
  embeds_many :projects
  embeds_many :clients
  embeds_many :uploads
  embeds_many :tasks
  embeds_many :invoices
  
  ## Attr Accessors ##
  
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :remember_me, :avatar_url
  
  before_save :generate_api_key
  
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
  
  alias_method :name, :full_name # I always type user.name instead of user.full_name

  def admin?
    self.role.downcase == "admin"
  end
  
  def first_login?
    self.sign_in_count == 1 && self.projects.count == 0 && self.clients.count == 0 && self.tasks.count == 0
  end
  
  # Generate a unique api key for this user
  def generate_api_key
    key = Digest::SHA1.hexdigest(Time.now.to_s + rand(12345678).to_s)[1..10]
    self.api_key = self._id.to_s + key
  end
    
end
