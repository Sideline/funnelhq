module ClientsHelper
  
  #
  #
  def find_client
    if @project.client_id.present?
      current_user.clients.find(@project.client_id).name
    else
      "N/A"
    end
  end
end
