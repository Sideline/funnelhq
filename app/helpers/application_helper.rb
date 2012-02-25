module ApplicationHelper
  
  # Returns a number as the right currency type for an account
  #
  # @param 
  # @return
  
  def user_currency(val)
    unit = current_user.account.get_currency
    number_to_currency(val, :unit => unit, :separator => ",", :delimiter => "")
  end
  
  # Returns a pretty formatted date
  #
  # @param 
  # @return 
  
  def pretty_date(input_date)
    return input_date.strftime("%d %B %Y")
  end
  
  # Returns a Gravatar URL
  #
  # @param [user] ActiveRecord User model
  # @return [Image Tag]
  
  def avatar_url(user)
    url = "http://www.gravatar.com/avatar/#{Digest::MD5::hexdigest(user.email)}?d=mm"
    image_tag(url, :alt => 'Avatar', :class => 'avatar')
  end
  
  # Pluralize a word without a count
  #
  # @param  [count] Integer based count
  # @param  [world] A string i.e 'Issue'
  # @return [String] 
  
  def plural_without_count(count, word)
    count == 1 ? word : word.pluralize
  end
  
  # Helper to find the current controller
  # e.g if controller?("dashboards")
  #
  # @param  
  # @return [String]
  
  def controller?(*controller)
    controller.include?(params[:controller])
  end
  
  # Helper to find the current action
  #
  # @param  
  # @return [String]
  
  def action?(*action)
    action.include?(params[:action])
  end
  
  # Returns the correct class for the side navigation
  #
  # @param  
  # @return [String]
  
  def nav_link_class(controller_name)
    controller?(controller_name) ? 'active' : 'passive'
  end
  
end
