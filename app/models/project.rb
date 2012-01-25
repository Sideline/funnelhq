class Project
  
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :title, :type => String
  field :description, :type => String
  
  validates_presence_of :title
  validates_presence_of :description
  
  embedded_in :user, :inverse_of => :projects
   
end
