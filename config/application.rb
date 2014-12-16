require File.expand_path('../boot', __FILE__)
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
require "active_model/railtie"

Bundler.require(*Rails.groups)

module UrlShortener
  class Application < Rails::Application
    
    config.autoload_paths += %W(
      #{config.root}/app/services
      #{config.root}/app/forms
    )

    config.action_view.field_error_proc = ->(html_tag, _) { html_tag.html_safe }

    require config.root.join('lib/rack/redirector.rb')
    config.middleware.insert_before Rack::Sendfile, Rack::Redirector
  end
end
