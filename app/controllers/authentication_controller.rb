class AuthenticationController < ApplicationController
  def authenticate
    user = User.find_by(username: user_params[:username]).try(:authenticate, user_params[:password])
    return head :unauthorized unless user.present?
    render json: user
  end

  private

  def user_params
    params.fetch(:user, {}).permit(:username, :password)
  end
end
