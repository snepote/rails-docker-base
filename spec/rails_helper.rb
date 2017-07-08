ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/poltergeist'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true

  Capybara.default_max_wait_time = 5

  Capybara.register_driver(:headless_chrome) do |app|
    capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
      chromeOptions: { args: %w[headless disable-gpu no-sandbox] }
    )

    Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      desired_capabilities: capabilities
    )
  end

  Capybara.javascript_driver = :headless_chrome
  Capybara::Webkit.configure do |config|
    config.debug = false
    config.block_unknown_urls
    # Allow pages to make requests to any URL without issuing a warning.
    # config.allow_unknown_urls
    # Allow a specific domain without issuing a warning.
    # config.allow_url("example.com")
    # Allow a specific URL and path without issuing a warning.
    # config.allow_url("example.com/some/path")
    # Wildcards are allowed in URL expressions.
    # config.allow_url("*.example.com")
    # Silently return an empty 200 response for any requests to the given URL.
    # config.block_url("example.com")

    # Timeout if requests take longer than 5 seconds
    config.timeout = 5

    # Don't raise errors when SSL certificates can't be validated
    config.ignore_ssl_errors

    # Don't load images
    config.skip_image_loading

    # Raise JavaScript errors as exceptions
    config.raise_javascript_errors = true
  end
end
