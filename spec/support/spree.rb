require 'spree/testing_support/factories'
require 'spree/testing_support/url_helpers'
require 'spree/testing_support/capybara_ext'

RSpec.configure do |config|
  config.include Spree::TestingSupport::UrlHelpers
end
