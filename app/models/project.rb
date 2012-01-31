class Project
  
  include Core::Mongoid::Document
  
  TYPES = %w(admin internal client personal)

  ## fields ##
  
  field :title, :type => String
  field :project_type, :type => String, :default => "None"
  field :description, :type => String
  field :project_active, :type => Boolean, :default => :true
  
  ## validations ##
  
  validates_presence_of :title
  validates_presence_of :description
  
  ## associations ##
  
  embedded_in :user, :inverse_of => :projects
  
  ## scopes ##
  
  scope :recent, order_by(:created_at => :desc).limit(5)
  
  ## methods ##
  
  def active?
    self.project_active
  end
    
end
