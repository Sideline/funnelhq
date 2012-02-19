class Invoice
  
  include Core::Mongoid::Document
  
  STATUS = %w(draft sent paid unpaid).map{|status| status.camelize}
  
  ## validations ##
  
  validates_presence_of :client_id
  
  ## fields ##
  
  field :invoice_id, :type => Integer
  field :client_id, :type => Integer
  
  ## associations ##

  embedded_in :user, :inverse_of => :invoices
  
  embeds_many :line_items
  
  accepts_nested_attributes_for :line_items
  validates_associated :line_items
  
end
