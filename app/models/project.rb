class Project
  
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :title, :type => String
  field :description, :type => String
  
  embedded_in :user, :inverse_of => :projects
   
end
