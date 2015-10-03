Airbrake.configure do |config|
  api_key = ENV['AIRBRAKE_API_KEY']
  host = ENV['AIRBRAKE_HOST']
  port = ENV['AIRBRAKE_PORT'].to_i
  secure = ENV['AIRBRAKE_SECURE'] == 'true'
  async = ENV['AIRBRAKE_SIDEKIQ'] == 'true'
  dev = ENV['AIRBRAKE_DEV'] == 'true'

  config.api_key = api_key
  config.host = host if host
  config.port = port if port > 0
  config.secure = secure || config.port == 443
  if async
    config.async do |notice|
      AirbrakeDeliveryWorker.perform_async(notice.to_xml)
    end
  end
  config.development_environments.delete('development') if dev
end
