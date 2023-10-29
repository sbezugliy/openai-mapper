# typed: false

module Openai
  module Chat
    class Completions < ::Openai::Resource::Api
      def initialize
        @path = "/v1/chat/completions"
        super()
      end

      def request(params)
        @response = @connection.post(
          path: @path,
          body: ::Openai::Request::Chat::Completion.new(**params).to_json
        )
        @data = ::Openai::Mapper::Chat::Completions.from_json(@response.body)
      end
    end
  end
end
