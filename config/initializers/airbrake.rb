Airbrake.configure do |config|
  config.api_key = ENV['AIRBRAKE_API_KEY']
  config.host = ENV['AIRBRAKE_HOST'] if ENV['AIRBRAKE_HOST']
  config.port = ENV['AIRBRAKE_PORT'] if ENV['AIRBRAKE_PORT']
  config.secure = config.port == 443
end
