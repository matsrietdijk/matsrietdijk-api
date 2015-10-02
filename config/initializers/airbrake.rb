Airbrake.configure do |config|
  api_key = ENV['AIRBRAKE_API_KEY']
  host = ENV['AIRBRAKE_HOST']
  port = ENV['AIRBRAKE_PORT'].to_i

  config.api_key = api_key
  config.host = host if host
  config.port = port if port > 0
  config.secure = config.port == 443
end
