module ApplicationHelper
  
  # Return a sensible date format in our views
  #
  def pretty_date(input_date)
    return input_date.strftime("%d %B %Y")
  end
  
  # Returns a gravatar url
  #
  def avatar_url(user)
    url = "http://www.gravatar.com/avatar/#{Digest::MD5::hexdigest(user.email)}?d=mm"
    image_tag(url, :alt => 'Avatar', :class => 'avatar')
  end
  
  # Does what it says
  #
  def plural_without_count(count, word)
    count == 1 ? word : word.pluralize
  end
end
