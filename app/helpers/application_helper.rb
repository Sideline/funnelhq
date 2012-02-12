module ApplicationHelper
  
  # Return a sensible date format in our views
  def pretty_date(input_date)
    return input_date.strftime("%d %B %Y")
  end
  
  # Returns a gravatar url
  def avatar_url(user)
    image_tag("http://www.gravatar.com/avatar/#{Digest::MD5::hexdigest(user.email)}?d=mm", :alt => 'Avatar', :class => 'avatar')
  end
  
end
