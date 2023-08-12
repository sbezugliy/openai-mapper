# typed: false

module Openai
  module Mapper
    class Functions < BaseMapper
      attribute :name, ::Shale::Type::String, default: -> {}
      attribute :parameters, ::Shale::Type::String, default: -> {}
    end
  end
end
