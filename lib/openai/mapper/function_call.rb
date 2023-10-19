# typed: false

module Openai
  module Mapper
    class FunctionCall < BaseMapper
      attribute :name, ::Shale::Type::String, default: -> {}
      attribute :arguments, ::Shale::Type::String, default: -> {}

      json do
        map "name", to: :name
        map "arguments", to: :arguments
      end
    end
  end
end
