module Openai
  module Images
    class Edit < ::Openai::Resource::ApiResource
      def initialize
        @path = "/v1/images/edits"
        @file_source = ::File.join(__dir__, "../../../input/")
        @boundary  = ::SecureRandom.hex(4)

        super()
      end


      def request(**request)
        @response = @connection.post(
          path: @path,
          headers: multipart_headers,
          body: multipart_body(::Openai::Request::Images::Edit.new(**request))
        ).tap {|r| puts r}
        puts @connection.inspect
        puts @response.inspect
        @data = ::Openai::Mapper::Images::List.from_json(@response.body)
      end

      private

      def multipart_headers
        {
          'Content-Type' => %{multipart/form-data; boundary="#{@boundary}"},
          "Authorization" => "Bearer #{ACCESS_TOKEN}"
        }
      end

      def multipart_body(request)
        puts request.inspect
        body      = ''
        body << multipart_attachment("image/png", "image", "image.png", ::File.open(::File.join(@file_source, request.image), "r").read)
        body << multipart_attachment("image/png", "mask", "mask.png", ::File.open(::File.join(@file_source, request.mask), "r").read) if request.mask
        # body << multipart_attachment("application/json", "request", "request.json", request.to_json)
        body << multipart_field("prompt", request.prompt)
        body << multipart_field("n", request.n)
        body << multipart_field("size", request.size)
        body << multipart_field("response_format", request.response_format)
        body << multipart_field("user", request.user)
        body << "--#{@boundary}--#{Excon::CR_NL}"
        body
      end
    end
  end
end
