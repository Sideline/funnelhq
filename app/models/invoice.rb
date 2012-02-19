class Invoice
  
  include Core::Mongoid::Document
  
  ## fields ##
  
  field :invoice_id, :type => Integer
  field :client_id, :type => Integer
  
  ## associations ##

  embedded_in :user, :inverse_of => :invoices
  
end
