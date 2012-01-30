class Project
  
  include Core::Mongoid::Document
  
  Types = %w(admin internal client)

  # Schema
  
  field :title, :type => String
  field :project_type, :type => String
  field :description, :type => String
  
  validates_presence_of :title
  validates_presence_of :description
  
  embedded_in :user, :inverse_of => :projects
  
  # Scopes 
  
  scope :recent, order_by(:created_at => :desc).limit(100)
  
end
