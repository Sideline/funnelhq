require "digest/sha1"

class User
  
  include Core::Mongoid::Document
  
  USER_ROLES = %w(admin client collaborator)
  
  UPLOAD_LIMIT = 5000000
  
  EMAIL_REGEX = /^[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

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
  
  ## Fields ##

  field :first_name, :type => String
  field :last_name, :type => String
  field :avatar_url, :type => String
  field :api_key, :type => String
  field :role, :type => String, :default => 'admin'

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
    
  ## Validation ##
     
  validates_presence_of :first_name, :last_name
  
  validates :email, presence: true, uniqueness: true, format: { with: EMAIL_REGEX }
  
  ## associations ##
  
  embeds_many :projects
  embeds_many :clients
  embeds_many :uploads
  embeds_many :tasks
  embeds_many :invoices
  embeds_many :issues
  
  ## Attr Accessors ##
  
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :remember_me, :avatar_url
  
  before_save :generate_api_key
  
  # Define some helper method for user roles
  #
  # @param 
  # @return []
  
  USER_ROLES.each do |_role|
    define_method("#{_role}?") do
      self.role == _role
    end
  end
  
  # 
  #
  # @param 
  # @return []
  
  def number_of_projects
    self.projects.count
  end
  
  # 
  #
  # @param 
  # @return []
  
  def recent_projects
    self.projects.criteria.and(:updated_at.gt => 2.weeks.ago)
  end
  
  # Returns the full name of a user
  #
  # @param 
  # @return [String] the users full name
   
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
  
  alias_method :name, :full_name # I always type user.name instead of user.full_name

  # Returns true if a user is an admin
  #
  # @param 
  # @return [Boolean]
  
  def admin?
    self.role.downcase == "admin"
  end
  
  # Returns true if user hasn't previously logged in to the application
  #
  # @param 
  # @return [Boolean]
  
  def first_login?
    
    m = ['projects', 'clients', 'tasks'].map { |n| n.to_sym }
    
    coll = m.map do |k|
      self.send(k).count
    end.unshift(self.sign_in_count)
    
    return coll.reject{ |x| x.nil? }.inject(:+) == 1
  end
  
  # Generate a unique api key for this user
  #
  # @param 
  # @return [String] unique API key for a user
  
  def generate_api_key
    key = Digest::SHA1.hexdigest(Time.now.to_s + rand(12345678).to_s)[1..10]
    self.api_key = self._id.to_s + key
  end
  
  # Checks the file attachment size
  #
  # @param 
  # @return [Boolean]
  
  def upload_limit_reached?
    self.uploads.sum(:file_file_size) > UPLOAD_LIMIT
  end
  
  # Returns the sum of all invoices for this user
  #
  # @param 
  # @return [Float]
  
  def invoice_total
    self.invoices.sum(:total).to_f
  end
end