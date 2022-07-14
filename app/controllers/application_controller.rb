class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  respond_to :json

  def current_user_owner
    head(403) unless current_api_v1_user.id.to_s == params[:user_id]
  end
end
