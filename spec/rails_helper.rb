require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
ENV['TEST_FRAMEWORK'] = 'rspec'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require "action_cable/testing/rspec"

ActiveRecord::Migration.maintain_test_schema!

ENV['RSPEC'] = 'true'

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.include FactoryBot::Syntax::Methods
  config.add_setting :adapter
  config.adapter = 'test'
end
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
