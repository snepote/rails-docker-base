ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/poltergeist'

# Checks for pending migration and applies them before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # Common Capybara config
  Capybara.default_max_wait_time = 20

  Capybara.javascript_driver = :webkit
  Capybara::Webkit.configure do |config|
    config.debug = true

    # By default, requests to outside domains (anything besides localhost) will
    # result in a warning. Several methods allow you to change this behavior.

    # Silently return an empty 200 response for any requests to unknown URLs.
    config.block_unknown_urls

    # Allow pages to make requests to any URL without issuing a warning.
    config.allow_unknown_urls

    # Allow a specific domain without issuing a warning.
    config.allow_url("example.com")

    # Allow a specific URL and path without issuing a warning.
    config.allow_url("example.com/some/path")

    # Wildcards are allowed in URL expressions.
    config.allow_url("*.example.com")

    # Silently return an empty 200 response for any requests to the given URL.
    config.block_url("example.com")

    # Timeout if requests take longer than 5 seconds
    config.timeout = 5

    # Don't raise errors when SSL certificates can't be validated
    config.ignore_ssl_errors

    # Don't load images
    config.skip_image_loading

    # Raise JavaScript errors as exceptions
    config.raise_javascript_errors = true
  end

  # Capybara.javascript_driver = :poltergeist
  # Capybara.register_driver :poltergeist do |app|
  #   Capybara::Poltergeist::Driver.new(app, {debug: false})
  # end
  #
  # Capybara.register_driver :iphone do |app|
  #   # ChromeDriver
  #   mobile_emulation = { deviceName: 'Apple iPhone 4' }
  #   caps = Selenium::WebDriver::Remote::Capabilities.chrome(
  #     "chromeOptions" => { "mobileEmulation" => mobile_emulation }
  #   )
  #   Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: caps)
  # end
end
