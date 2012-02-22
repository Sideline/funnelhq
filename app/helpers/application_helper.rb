module ApplicationHelper
  
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
end
