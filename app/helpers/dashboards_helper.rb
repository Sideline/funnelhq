module DashboardsHelper
  
  # Returns the plural without a count i.e 1 project => project
  def stats_plural mod
    count = current_user.send("#{mod}".to_sym).size
    pluralize(count, mod[0..-2]).split.last
  end
end
