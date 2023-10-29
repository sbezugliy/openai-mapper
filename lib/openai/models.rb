# typed: false

module Openai
  class Models < ::Openai::Resource::Api
    def initialize
      @path = "/v1/models"
      super()
    end

    def request
      @response = @connection.get(path: @path)
      @data = ::Openai::Mapper::Models.from_json(super())
    end
  end
end
