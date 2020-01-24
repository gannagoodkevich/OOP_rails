require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Untitled1
  class Application < Rails::Application
    config.load_defaults 6.0

    config.i18n.available_locales = [:en, :ru]
    config.i18n.default_locale = :en

    Warden::Manager.serialize_into_session do |user|
      user.id
    end

    Warden::Manager.serialize_from_session do |id|
      User.find_by_id(id)
    end

    Rails.application.config.middleware.use Warden::Manager do |manager|
      manager.default_strategies :password
      manager.failure_app = UnauthorizedController
    end
  end
end
