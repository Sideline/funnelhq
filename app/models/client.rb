class Client
  
  include Core::Mongoid::Document
  
  ## fields ##
  
  field :first_name, :type => String
  field :last_name, :type => String
  field :email, :type => String
  field :telephone, :type => String
  
  ## Validation ##
  
  validates_presence_of :first_name, :last_name
  validates :email, presence: true, uniqueness: true, format: { with: /^[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i }
  validates_numericality_of :telephone
  
  ## ##
  
  embedded_in :user, :inverse_of => :clients

  ## Methods ##
  
  class << self
    
  end
  
  # Returns a users full name
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
  
  alias_method :name, :full_name
   
end
