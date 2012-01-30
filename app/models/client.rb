class Client
  
  include Core::Mongoid::Document
  
  ## fields ##
  
  field :first_name, :type => String
  field :last_name, :type => String
  field :email, :type => String
  field :telephone, :type => String
end
