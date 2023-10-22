module Openai
  module Images
    class Create < ::Openai::Resource::ApiResource
      def initialize
        @path = "/v1/images/create"
        super()
      end

      def resource(request)
        @response = @connection.post(
          path: @path,
          body: ::Openai::Request::Images::Create.new(**request).to_json
        )
        @data = ::Openai::Mapper::Images::List.from_json(@response.body)
      end
    end
  end
end
