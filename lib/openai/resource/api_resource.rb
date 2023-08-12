# typed: false
# frozen_string_literal: true

module Openai
  module Resource
    class ApiResource
      attr_reader :connection, :path, :data, :response

      def initialize
        Excon.defaults[:ssl_verify_peer] = false
        @connection = Excon.new(BASE_URL, headers: headers)
      end

      def resource
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
    end
  end
end
