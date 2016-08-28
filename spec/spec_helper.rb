ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

require 'capybara/rspec'
Capybara.javascript_driver = :selenium

ActiveRecord::Migration.maintain_test_schema! if defined?(ActiveRecord::Migration)

DatabaseCleaner.strategy = :truncation

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.full_backtrace=false

  config.include Requests::JsonHelpers, type: :api

  config.before(:each, type: :controller) do |example|
    unless example.metadata[:skip_before]
      allow(controller).to receive(:authenticate_request!)
      allow(controller).to receive(:current_user) { create(:user) }
    end
  end
end
