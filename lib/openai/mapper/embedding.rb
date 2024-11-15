# typed: false

module Openai
  module Mapper
    class Embedding < ::Openai::Mapper::BaseMapper
      attribute :object, ::Shale::Type::String, default: -> { "embedding" }
      attribute :arguments, ::Shale::Type::Float, collection: true
      attribute :index, ::Shale::Type::String, default: -> { 0 }

      json do
        map "name", to: :name
        map "arguments", to: :arguments
        map "index", to: :index
      end
    end
  end
end
