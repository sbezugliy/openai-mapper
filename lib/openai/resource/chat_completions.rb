# typed: false

module Openai
  module Resource
    class ChatCompletions < ApiResource
      def initialize(**params)
        @path = "/v1/chat/completions"
        @params = params
        map_params
        super()
      end

      def resource
        pp @request_body
        @response = @connection.post(path: @path, body: @request_body)
        pp @response
        @data = ::Openai::Mapper::Chat::Completion.new.from_json(super())
      end

      private

      def map_params
        @request_body = ::Openai::Mapper::Chat::Request.new(**@params).to_json
      end
    end
  end
end
