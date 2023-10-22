# typed: false

module Openai
  class Model < ::Openai::Resource::ApiResource
    def initialize
      @path = "/v1/models"
      super()
    end

    def request(model_id)
      @response = @connection.get(path: [@path, model_id].join("/"))
      @data = ::Openai::Mapper::Model.from_json(super())
    end
  end
end
