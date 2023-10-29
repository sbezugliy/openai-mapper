# typed: false
# frozen_string_literal: true

require 'securerandom'

module Openai
  module Resource
    class Api
      attr_reader :connection, :path, :data, :response

      def initialize
        Excon.defaults[:ssl_verify_peer] = false
        @connection = Excon.new(BASE_URL, headers: headers)
      end

      def request
        parse_body
      end

      private

      def ssl_options
        {verify: true, verify_mode: 0}
      end

      def headers
        {
          "Content-Type" => "application/json",
          "Authorization" => "Bearer #{ACCESS_TOKEN}"
        }
      end

      def parse_body
        @data = @response.body
      end

      def multipart_attachment(content_type, key, file_name, data)
        data.binmode if data.respond_to?(:binmode)
        data.pos = 0 if data.respond_to?(:pos=)
        body = "--#{@boundary}#{Excon::CR_NL}"
        body << %{Content-Disposition: form-data; name="#{key}"; filename="#{file_name}"#{Excon::CR_NL}}
        body << "Content-Type: #{content_type}#{Excon::CR_NL}"
        body << Excon::CR_NL
        body << data.to_s
        body << Excon::CR_NL
        body
      end

      def multipart_field(key, value)
        body = "--#{@boundary}#{Excon::CR_NL}"
        body << %{Content-Disposition: form-data; name="#{key.to_s}"#{Excon::CR_NL}}
        body << Excon::CR_NL
        body << value.to_s
        body << Excon::CR_NL
        body
      end
    end
  end
end