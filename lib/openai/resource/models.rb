# typed: false

module Openai
  module Resource
    class Models < ApiResource
      def initialize
        @path = "/v1/models"
        super()
      end

      def resource
        @response = @connection.get(path: @path)
        @data = ::Openai::Mapper::Models.from_json(super())
      end
    end
  end
end
