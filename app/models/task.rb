class Task
  
  include Core::Mongoid::Document
  
  STATUSES = %w(in-progress on-hold complete)
  
  ## validations ##
  
  validates_presence_of :title

  ## associations ##
  
  embedded_in :user, :inverse_of => :tasks
  
  ## fields ##
  
  field :title, :type => String
  field :status, :type => String, :default => 'in-progress'
  field :project_title, :type => String
  
  ## Scope ##
  
  scope :active, :where => {:status => 'in-progress'}

  ## methods ##
  
  # Returns true if a project is complete
  #
  # @param 
  # @return [Boolean]
  
  def complete?
    self.complete
  end
end