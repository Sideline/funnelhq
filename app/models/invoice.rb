class Invoice
  
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes
  
  STATUS = %w(draft sent paid unpaid).map{|status| status.camelize}
  
  ## validations ##
  
  ## fields ##
  
  field :invoice_id, :type => Integer
  field :client_id, :type => Integer
  field :date, :type => Date
  
  ## associations ##

  embedded_in :user, :inverse_of => :invoices
  
  embeds_many :line_items
  
  accepts_nested_attributes_for :line_items
  validates_associated :line_items
  
end
