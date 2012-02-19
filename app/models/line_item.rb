class LineItem
  
  include Core::Mongoid::Document
  
  field :item, :type => String
  field :price, :type => Integer
  
end
