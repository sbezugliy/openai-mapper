# typed: false

module Openai
  module Mapper
    class FunctionCall < BaseMapper
      attribute :name, ::Shale::Type::String, default: -> {}
      attribute :arguments, ::Shale::Type::String, default: -> {}
    end
  end
end
