require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsTemplate
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1
    config.hosts << 'moral-polecat-content.ngrok-free.app'
    config.hosts << 'bvu.bragamat.com'
    config.hosts << '*.railway.com'
    config.hosts << 'bvu-production.up.railway.app'

    # Please, see: https://guides.rubyonrails.org/autoloading_and_reloading_constants.html#config-autoload-lib-ignore.
    config.autoload_lib(ignore: %w[assets tasks])

    # Log to STDOUT because Docker expects all processes to log here. You could
    # then collect logs using journald, syslog or forward them somewhere else.
    config.logger = ActiveSupport::Logger.new(STDOUT)
                                         .tap  { |logger| logger.formatter = ::Logger::Formatter.new }
                                         .then { |logger| ActiveSupport::TaggedLogging.new(logger) }

    # Set Redis as the back-end for the cache.
    config.cache_store = :redis_cache_store, {
      url: ENV.fetch('REDIS_URL'),
      namespace: 'cache'
    }

    # Set Sidekiq as the back-end for Active Job.
    config.active_job.queue_adapter = :sidekiq

    # Mount Action Cable outside the main process or domain.
    config.action_cable.mount_path = nil
    config.action_cable.url = ENV.fetch('ACTION_CABLE_FRONTEND_URL') { 'ws://localhost:28080' }

    # Only allow connections to Action Cable from these domains.
    origins = ENV.fetch('ACTION_CABLE_ALLOWED_REQUEST_ORIGINS') { "http:\/\/localhost*" }.split(',')
    origins.map! { |url| /#{url}/ }

    config.assets.css_compressor = nil

    config.action_cable.allowed_request_origins = origins

    Rails.configuration.to_prepare do
      require_relative '../active_storage/ransackable_attachment'
    end
  end
end
