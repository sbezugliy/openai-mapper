# typed: false

module Openai
  module Mapper
    class AssistantFile < ::Openai::Mapper::BaseMapper
      attribute :id, ::Shale::Type::String
      attribute :object, ::Shale::Type::String, default: -> { "assistant.file" }
      attribute :created_at, ::Shale::Type::Time
      attribute :assistant_id, ::Shale::Type::String

      json do
        map "id", to: :id
        map "object", to: :object
        map "created_at", using: {from: :from_timestamp, to: :to_timestamp}
        map "assistant_id", to: :assistant_id
      end
    end
  end
end
