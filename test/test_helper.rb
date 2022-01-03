ENV['RAILS_ENV'] = 'test'

require 'minitest/autorun'
require 'minitest/unit'
require 'minitest/pride'

require File.expand_path('../dummy/config/environment.rb', __FILE__)

require 'database_cleaner'

require 'minifacture'
require 'factories'

require 'recommendable'

ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

DatabaseCleaner.strategy = :transaction
Rails.backtrace_cleaner.remove_silencers!

DatabaseCleaner.start

MiniTest::Unit.after_tests do
  DatabaseCleaner.clean
  Recommendable.redis.flushdb
end


