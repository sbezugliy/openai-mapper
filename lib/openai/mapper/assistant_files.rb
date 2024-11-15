# typed: false

module Openai
  module Mapper
    class AssistantFiles < ::Openai::Mapper::BaseMapper
      attribute :object, ::Shale::Type::String, default: -> { "embedding" }
      attribute :data, ::Openai::Mapper::AssistantFile, collection: true
      attribute :first_id, ::Shale::Type::String
      attribute :last_id, ::Shale::Type::String
      attribute :has_more, ::Shale::Type::Boolean

      json do
        map "object", to: :object
        map "data", to: :data
        map "first_id", to: :first_id
        map "last_id", to: :last_id
        map "has_more", to: :has_more
      end
    end
  end
end
