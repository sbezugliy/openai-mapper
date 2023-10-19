# typed: false

module Openai
  module Mapper
    class Functions < BaseMapper
      attribute :name, ::Shale::Type::String, default: -> {}
      attribute :parameters, ::Shale::Type::String, default: -> {}

      json do
        map "name", to: :name
        map "parameters", to: :parameters
      end
    end
  end
end
