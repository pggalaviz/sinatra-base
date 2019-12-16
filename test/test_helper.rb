ENV['RACK_ENV'] = 'test'

require "minitest/autorun"
require 'minitest/hooks/default'
require 'capybara/dsl'
require 'capybara/minitest'
require 'rack/test'

require_relative '../app'

Capybara.app = App

class Minitest::HooksSpec
  include Rack::Test::Methods
  include Capybara::DSL
  include Capybara::Minitest::Assertions

  def app
    App
  end

  if defined?(Capybara)
    after do
      Capybara.reset_sessions!
      Capybara.use_default_driver
    end
  end
end
