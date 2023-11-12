# typed: false

module Openai
  module Mapper
    class Assistant < ::Openai::Mapper::BaseMapper
      attribute :id, ::Shale::Type::String
      attribute :object, ::Shale::Type::String, default: -> { "assistant" }
      attribute :created_at, ::Shale::Type::Time
      attribute :name, ::Shale::Type::String
      attribute :description, ::Shale::Type::String, default: -> {}
      attribute :model, ::Shale::Type::String
      attribute :instructions, ::Shale::Type::String, default: -> {}
      attribute :tools, ::Openai::Mapper::Tool, collection: true
      attribute :file_ids, ::Shale::Type::String, collection: true
      attribute :metadata, ::Shale::Type::String

      json do
        map "id", to: :id
        map "object", to: :object
        map "created_at", using: {from: :from_timestamp, to: :to_timestamp}
        map "name", to: :name
        map "description", to: :description
        map "model", to: :model
        map "instructions", to: :instructions
        map "tools", to: :tools
        map "file_ids", to: :file_ids
        map "metadata", to: :metadata
      end
    end
  end
end
