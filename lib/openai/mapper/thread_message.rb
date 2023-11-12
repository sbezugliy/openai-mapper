# typed: false

module Openai
  module Mapper
    class ThreadMessage < ::Openai::Mapper::BaseMapper
      attribute :id, ::Shale::Type::String
      attribute :object, ::Shale::Type::String, default: -> { "thread.message" }
      attribute :created_at, ::Shale::Type::Time
      attribute :thread_id, ::Shale::Type::String
      attribute :role, ::Shale::Type::String, default: -> { "assistant" }
      attribute :content, ::Openai::Mapper::Content, collection: true
      attribute :assistant_id, ::Shale::Type::String
      attribute :file_ids, ::Shale::Type::String, collection: true
      attribute :run_id, ::Shale::Type::String
      attribute :metadata, ::Shale::Type::String

      json do
        map "id", to: :id
        map "object", to: :object
        map "created_at", using: {from: :from_timestamp, to: :to_timestamp}
        map "thread_id", to: :thread_id
        map "role", to: :role
        map "content", to: :content
        map "assistant_id", to: :assistant_id
        map "file_ids", to: :file_ids
        map "run_id", to: :run_ids
        map "metadata", to: :metadata
      end
    end
  end
end
