class Task
  
  include Core::Mongoid::Document
  
  ## associations ##
  
  field :title, :type => String
  
end
