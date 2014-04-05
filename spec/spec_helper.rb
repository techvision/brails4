# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rails'
require 'capybara/rspec'
require 'rspec/autorun'
require "paperclip/matchers"
require 'simplecov'
require 'coveralls'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].sort.each {|f| require f}

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
#ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include Devise::TestHelpers, :type => :controller
  config.include Mongoid::Matchers, type: :model
  config.include Paperclip::Shoulda::Matchers
  config.include LoginHelpers, type: :controller
  config.include LoginHelpers, type: :feature
  config.include LoginHelpers, type: :request
  SimpleCov.start 'rails'
  Coveralls.wear!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false
  config.filter_run :focus => true
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.filter_run_excluding :fail => true
  config.run_all_when_everything_filtered = true

  config.before(:suite) do
    Role.destroy_all
    roles = [{name: Role::Admin}, {name: Role::Student}] 
    Role.create(roles)

    DatabaseCleaner.strategy = :truncation, {:except => %w[roles]}
    DatabaseCleaner.orm = 'mongoid'
  end

  config.order = "default"

  config.before(:each) do
    DatabaseCleaner.start 
  end

  config.after(:each) do
    DatabaseCleaner.clean 
  end

  config.before(:all) do
    DatabaseCleaner.clean 
  end

  config.after(:suite) do
    DatabaseCleaner.clean
  end
end
