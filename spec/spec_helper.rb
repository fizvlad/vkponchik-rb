# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

require 'vkponchik'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

require 'dotenv/load'

# @return [String] spec group ID
def vkponchik_group
  Integer(ENV['VKPONCHIK_GROUP'], 10)
end

# @return [String] spec group API token
def vkponchik_token
  ENV['VKPONCHIK_TOKEN']
end
