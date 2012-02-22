module DashboardsHelper
  
  # 
  #
  # @param 
  # @return
  
  def stats_plural mod
    count = current_user.send("#{mod}".to_sym).size
    pluralize(count, mod[0..-2]).split.last
  end
end
