module Openai
  module Chat
    class Completions < ::Openai::Resource::ApiResource
      def initialize
        @path = "/v1/chat/completions"
        super()
      end

      def request(request)
        @response = @connection.post(
          path: @path,
          body: ::Openai::Request::Chat::Completion.new(**request).to_json
        )
        @data = ::Openai::Mapper::Chat::Completions.from_json(@response.body)
      end
    end
  end
end
