class Account
  
  include Core::Mongoid::Document
  
  CURRENCY_SYMBOLS = { :usd => '&dollar;', :gbp => '&pound;' }

  references_many :users, :inverse_of => :account
  
  ## fields ##

  field :time_zone
  field :currency, :type => String, :default => 'gbp'
  
  # Returns a string representation of account currency
  # Example: Account.last.get_currency => '&pound;'
  #
  # @param 
  # @return
  
  def get_currency
    CURRENCY_SYMBOLS[self.currency.to_sym]
  end
  
  # Used as a helper for select boxes when dealing with currency
  #
  # @param 
  # @return [Array] an array of supported currencies
  
  def currency_array
    CURRENCY_SYMBOLS.keys.map{ |c| c.to_s}
  end
  
end
