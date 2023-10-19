# typed: false

module Openai
  module Mapper
    class Message < BaseMapper
      attribute :role, ::Shale::Type::String
      attribute :content, ::Shale::Type::String, default: -> {}
      attribute :function_call, ::Openai::Mapper::FunctionCall, default: -> {}

      json do
        map "role", to: :role
        map "content", to: :content
        map "function_call", to: :function_call
      end
    end
  end
end
