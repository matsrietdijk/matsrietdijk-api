redis_url = ENV['REDIS_URL']
redis_ns = ENV['REDIS_NAMESPACE'] || "matsrietdijk-api-#{Rails.env}"
redis_config = { url: redis_url, namespace: redis_ns }

Sidekiq.configure_server do |config|
  redis_config[:size] = 2
  config.redis = redis_config
end

Sidekiq.configure_client do |config|
  redis_config[:size] = 1
  config.redis = redis_config
end
