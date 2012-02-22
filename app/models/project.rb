class Project
  
  include Core::Mongoid::Document
  
  TYPES = %w(admin internal client personal software design other).map {|type| type.camelize}.sort

  ## fields ##
  
  field :title, :type => String
  field :project_type, :type => String, :default => "None"
  field :description, :type => String
  field :project_active, :type => Boolean, :default => :true
  field :client_id, :type => Integer
  
  ## validations ##
  
  validates_presence_of :title
  validates_presence_of :description
  
  ## associations ##
  
  embedded_in :user, :inverse_of => :projects
  
  ## scopes ##
  
  scope :recent, order_by(:created_at => :desc).limit(3)
  scope :active, :where => {:project_active => true}
  scope :closed, :where => {:project_active => false}
  
  ## methods ##
  
  # Returns true if a project is active
  #
  # @param 
  # @return [Boolean]
  
  def active?
    self.project_active
  end
  
  # Returns yes if a project is active, else false
  #
  # @param 
  # @return [String]
  
  def active_yes_no?
    active? ? "Yes" : "No"
  end
    
end
