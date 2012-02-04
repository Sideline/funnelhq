class Task
  
  include Core::Mongoid::Document
  
  ## validations ##
  
  validates_presence_of :title

  ## associations ##
  
  embedded_in :user, :inverse_of => :tasks
  
  ## fields ##
  
  field :title, :type => String
  field :complete, :type => Boolean, :default => false
  
  ## methods ##
  
  class << self
    
  end
  
  def complete?
    self.complete 
  end
  
end
