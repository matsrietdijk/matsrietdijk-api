module ControllerSpecHelpers
  def authenticate(user)
    credentials = [user.api_token, { username: user.username }]
    header = ActionController::HttpAuthentication::Token.encode_credentials(*credentials)
    request.env['HTTP_AUTHORIZATION'] = header
  end
end
