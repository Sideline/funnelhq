class ApiV1::BaseController < ActionController::Base
  
  respond_to :json, :xml
  
  before_filter :authenticate_user!
  
  private
  
  def authenticate_user!
    @api_user = User.first(conditions: {api_key: params[:key]})
    unless @api_user 
      respond_with({:error => "Token is invalid." })
    end
  end
  

end
