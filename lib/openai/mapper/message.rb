# typed: false

module Openai
  module Mapper
    class Message < BaseMapper
      attribute :role, ::Shale::Type::String
      attribute :content, ::Shale::Type::String, default: -> {}
      attribute :function_call, ::Openai::Mapper::FunctionCall, default: -> {}
    end
  end
end
