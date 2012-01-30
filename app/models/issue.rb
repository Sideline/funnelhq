class Issue
  
  include Core::Mongoid::Document
  
  # Schema
  
  field :title, :type => String
  field :description, :type => String
  field :status, :type => String
  
  # Constants
  
  STATUSES = %w(open closed in-progress)
  
  # Validation
  
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :status
  
  # Scopes
  
  scope :recent, order_by(:created_at => :desc).limit(100)
  
  # Named scopes
  
  named_scope :open, :where => { :status => "open" }
  named_scope :closed, :where => { :status => "closed" }
  
end
