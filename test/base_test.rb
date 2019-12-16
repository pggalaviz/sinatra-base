require_relative 'test_helper'
require 'capybara/minitest/spec'

describe "Base" do
  specify "Should handle home page" do
    visit('/')
    _(page.current_path).must_equal '/'
    _(page).must_have_content('Hello from Sinatra!')
  end
end
