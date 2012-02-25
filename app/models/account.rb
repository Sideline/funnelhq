class Account
  
  include Core::Mongoid::Document

  references_many :users, :inverse_of => :account
  
  ## fields ##

  field :time_zone
  
end
