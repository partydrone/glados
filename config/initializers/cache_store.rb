Rails.application.configure do
  # Set Redis as the back-end for the cache.
  config.cache_store = :redis_store, ENV['REDIS_CACHE_URL']
end
