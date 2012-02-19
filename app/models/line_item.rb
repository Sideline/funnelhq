class LineItem
  
  include Core::Mongoid::Document
  
  field :qty, :type => Integer
  field :description, :type => String
  field :price, :type => Integer
 
  embedded_in :invoice, :inverse_of => :line_items
  
  ## validations ##
  
  validates_presence_of :qty
  validates_presence_of :price
  validates_presence_of :description

end
