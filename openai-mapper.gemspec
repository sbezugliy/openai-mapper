# frozen_string_literal: true

require_relative "lib/openai/version"

Gem::Specification.new do |spec|
  spec.name = "openai-mapper"
  spec.version = Openai::VERSION
  spec.authors = ["Sergey Bezugliy"]
  spec.email = ["s.bezugliy@gmail.com"]
  spec.licenses    = ['MIT']

  spec.summary = "OpenAI resources API client and object mapper"
  spec.description = "OpenAI resources API client and object mapper"
  spec.homepage = "https://github.com/sbezugliy/openai-mapper"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org/"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/sbezugliy/openai-mapper"
  spec.metadata["changelog_uri"] = "https://github.com/sbezugliy/openai-mapper/CHANGELOG.MD"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile output])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "excon"
  spec.add_dependency "shale"
  # spec.add_dependency "faraday_middleware"
  # spec.add_dependency "async-http-faraday"
  spec.add_dependency "rake"
  spec.add_dependency "zeitwerk"
  spec.add_dependency "mimemagic"
  spec.add_dependency "ox"
  spec.add_dependency "tomlib"
  spec.add_dependency "pry"

  # Uncomment to register a new dependency of your gem
  spec.add_development_dependency "dotenv"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rubocop", "~> 1.56.0"
  spec.add_development_dependency "rubocop-capybara"
  spec.add_development_dependency "rubocop-factory_bot"
  spec.add_development_dependency "rubocop-performance", "~> 1.18.0"
  spec.add_development_dependency "rubocop-rake"
  spec.add_development_dependency "rubocop-rspec"
  spec.add_development_dependency "rubocop-packs"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "standard", "~> 1.30"
  spec.add_development_dependency "standard-performance", "~> 1.1.0"
  spec.add_development_dependency "shoulda-matchers"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "async-rspec", "~> 1.2"

  spec.add_development_dependency "bundler-audit"
  spec.add_development_dependency "dawnscanner"
  spec.add_development_dependency "ruby_audit"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
