# typed: false

module Openai
  module Resource
    class Model < ApiResource
      def initialize
        @path = "/v1/models"
        super()
      end

      def resource(model_id)
        @response = @connection.get(path: [@path, model_id].join("/"))
        @data = ::Openai::Mapper::Model.from_json(super())
      end
    end
  end
end
