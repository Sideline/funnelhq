module ApplicationHelper
  
  # Return a sensible date format in our views
  def pretty_date(input_date)
    return input_date.strftime("%d %B %Y")
  end
  
end
