class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate_user

  private

  def authenticate_user
    user = authenticate_with_http_token do |token, options|
      User.where(username: options[:username], api_token: token).first
    end
    @current_user = user if user.present?
  end
end
