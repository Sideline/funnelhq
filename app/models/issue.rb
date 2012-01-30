class Issue
  
  include Core::Mongoid::Document
  
  ## fields ##
  
  field :title, :type => String
  field :description, :type => String
  field :status, :type => String
  
  ## constants ##
  
  STATUSES = %w(open closed in-progress)
  
  ## validation ##
  
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :status
  
  ## associations ##
  
  embedded_in :project, :inverse_of => :issues
  
  ## scopes ##
  
  scope :recent, order_by(:created_at => :desc).limit(100)
  
  named_scope :open, :where => { :status => "open" }
  named_scope :closed, :where => { :status => "closed" }
  
end
