module Openai
  module Resource
    module Chat
      class Completions < ApiResource
        def initialize
          @path = "/v1/chat/completions"
          super()
        end

        def resource(request)
          @response = @connection.post(
            path: @path,
            body: ::Openai::Mapper::Chat::Request.new(**request).to_json
          )
          @data = ::Openai::Mapper::Chat::Completions.from_json(@response.body)
        end
      end
    end
  end
end
