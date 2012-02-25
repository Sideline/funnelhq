class Account
  
  include Core::Mongoid::Document

  references_many :users, :inverse_of => :account
  
  ## fields ##
  
  field :first_name, :type => String
  field :last_name, :type => String
  field :email, :type => String
  field :telephone, :type => String
  
end
