# typed: false

if ["test", "development"].include?(ENV["BUNDLE_ENV"])
  require "dotenv"
  Dotenv.load
end

require "zeitwerk"
require "excon"
require "shale"
require "ox"
require "tomlib"
require "shale/adapter/ox"

loader = Zeitwerk::Loader.for_gem
loader.setup

Shale.xml_adapter = Shale::Adapter::Ox
Shale.toml_adapter = Tomlib

module Openai
  BASE_URL = "https://api.openai.com"
  ACCESS_TOKEN = ENV.fetch("OPENAI_TOKEN")
  ORGANIZATION = ENV.fetch("OPENAI_ORGANIZATION")

  class Error < StandardError; end
end

loader.eager_load
