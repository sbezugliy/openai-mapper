# typed: false

module Openai
  module Mapper
    class Embeddings < ::Openai::Mapper::BaseMapper
      attribute :object, ::Shale::Type::String, default: -> { "embedding" }
      attribute :data, ::Openai::Mapper::Embedding, collection: true
      attribute :model, ::Shale::Type::String
      attribute :usage, ::Openai::Mapper::Usage

      json do
        map "object", to: :object
        map "data", to: :data
        map "model", to: :model
        map "usage", to: :usage
      end
    end
  end
end
