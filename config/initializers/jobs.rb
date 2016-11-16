Rails.application.configure do
  # Set Sidekiq as the back-end for Active Job.
  config.active_job.queue_adapter = :sidekiq
  config.active_job.queue_name_prefix = "#{ENV['ACTIVE_JOB_QUEUE_PREFIX']}_#{Rails.env}"
end
