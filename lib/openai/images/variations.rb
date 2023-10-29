# typed: false

module Openai
  module Images
    class Variations < ::Openai::Resource::Api
      def initialize
        @path = "/v1/images/variations"
        @boundary = ::SecureRandom.hex(4)

        super()
      end

      def request(**params)
        @response = @connection.post(
          path: @path,
          headers: multipart_headers,
          body: multipart_body(::Openai::Request::Images::Variations.new(**params))
        ).tap { |r| puts r }
        @data = ::Openai::Mapper::Images::List.from_json(@response.body)
      end

      private

      def multipart_headers
        {
          "Content-Type" => %(multipart/form-data; boundary="#{@boundary}"),
          "Authorization" => "Bearer #{ACCESS_TOKEN}"
        }
      end

      def multipart_body(params)
        body = ""
        body << attach_image("image", "image.png", read_image(params.image))
        body << multipart_fields(params)
        body << "--#{@boundary}--#{Excon::CR_NL}"
        body
      end

      def multipart_fields(params)
        body = multipart_field("n", params.n)
        body << multipart_field("size", params.size)
        body << multipart_field("response_format", params.response_format)
        body << multipart_field("user", params.user)
        body
      end
    end
  end
end
