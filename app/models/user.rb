class User
  
  include Core::Mongoid::Document

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
    
  # Validation 
     
  validates_presence_of :first_name, :last_name
  validates_uniqueness_of :email, :case_sensitive => false
  
  # Relationships
  
  embeds_many :projects
  
  # Attr Accessors
  
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :remember_me
  
  # Schema
  
  field :first_name
  field :last_name
  
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
    
end
