Sidekiq.configure_server do |config|
   config.redis = { url: 'redis://127.0.0.1:6379' }
  #  config.periodic do |mgr|
  #   mgr.register('* * * * *', 'SendReportJob') #every_minute
  # end
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://127.0.0.1:6379' }
end
