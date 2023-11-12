# typed: false

module Openai
  module Mapper
    class File < ::Openai::Mapper::BaseMapper
      attribute :id, ::Shale::Type::String
      attribute :object, ::Shale::Type::String, default: -> { "file" }
      attribute :bytes, ::Shale::Type::Integer
      attribute :created_at, ::Shale::Type::Time
      attribute :filename, ::Shale::Type::String
      attribute :purpose, ::Shale::Type::String
      attribute :status, ::Shale::Type::String, default: -> {}
      attribute :status_details, ::Shale::Type::String, default: -> {}

      json do
        map "id", to: :id
        map "object", to: :object
        map "bytes", to: :bytes
        map "created_at", using: {from: :from_timestamp, to: :to_timestamp}
        map "filename", to: :filename
        map "purpose", to: :purpose
        map "status", to: :status
        map "status_details", to: :status_details
      end
    end
  end
end
