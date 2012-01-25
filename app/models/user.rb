class User
  
  include Mongoid::Document
  include Mongoid::Timestamps
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    
  # Validation    
  validates_presence_of :name
  validates_uniqueness_of :name, :email, :case_sensitive => false
  
  # Relationships
  
  embeds_many :projects
  
  # Attr Accessors
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  
  # Structure
  field :name
  
end
