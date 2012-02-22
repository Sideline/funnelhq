class Issue
  
  include Core::Mongoid::Document
  
  ## fields ##
  
  field :title, :type => String
  field :description, :type => String
  field :status, :type => String
  field :project_title, :type => String
  field :raised_by, :type => String
    
  ## constants ##
  
  STATUSES = %w(open closed in-progress)
  
  ## validation ##
  
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :project_title
  
  ## associations ##
  
  embedded_in :user, :inverse_of => :issues
    
  ## scopes ##
  
  scope :recent, order_by(:created_at => :desc).limit(100)
  
  named_scope :open, :where => { :status => "open" }
  named_scope :closed, :where => { :status => "closed" }
  
end
