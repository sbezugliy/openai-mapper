# typed: false

module Openai
  module Mapper
    class Thread < ::Openai::Mapper::BaseMapper
      attribute :id, ::Shale::Type::String
      attribute :object, ::Shale::Type::String, default: -> { "assistant" }
      attribute :created_at, ::Shale::Type::Time
      attribute :metadata, ::Shale::Type::String

      json do
        map "id", to: :id
        map "object", to: :object
        map "created_at", using: {from: :from_timestamp, to: :to_timestamp}
        map "metadata", to: :metadata
      end
    end
  end
end
