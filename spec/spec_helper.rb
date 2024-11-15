# typed: false
# frozen_string_literal: true

require "webmock/rspec"

require "openai"

require "support/mapper_helpers"

ENV["GEM_ENV"] = "test"
ENV["BUNDLE_ENV"] = "test"

OPENAI_URL = ENV.fetch("OPENAI_URL", "https://api.openai.com")
OPENAI_TOKEN = ENV.fetch("OPENAI_TOKEN", "supersecrettoken")

RSpec.configure do |config|
  config.include MapperHelpers
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before request: true do
    # WebMock.disable!
    WebMock.disable_net_connect!(allow_localhost: true)
    # stub_request(:any, OPENAI_URL).with(token_auth: [OPENAI_TOKEN])
  end
end
