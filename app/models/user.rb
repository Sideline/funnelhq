class User
  
  include Mongoid::Document
  include Mongoid::Timestamps
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
    
  # Validation 
     
  validates_presence_of :name
  validates_uniqueness_of :name, :email, :case_sensitive => false
  
  # Relationships
  
  embeds_many :projects
  
  # Attr Accessors
  
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  
  # Schema
  
  field :name
  
  # Returns number of projects for a user
  
  def number_of_projects
    self.projects.count
  end
  
  # Returns projects created in the last two weeks
  
  def recent_projects
    self.projects.criteria.and(:updated_at.gt => 2.weeks.ago)
  end
    
end
