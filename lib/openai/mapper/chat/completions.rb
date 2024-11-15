# typed: false

module Openai
  module Mapper
    module Chat
      class Completions < ::Openai::Mapper::BaseMapper
        attribute :id, ::Shale::Type::String
        attribute :object, ::Shale::Type::String
        attribute :created, ::Shale::Type::Time
        attribute :model, ::Shale::Type::String
        attribute :system_fingerprint, ::Shale::Type::String
        attribute :choices, ::Openai::Mapper::Choices, collection: true
        attribute :usage, ::Openai::Mapper::Usage

        json do
          map "id", to: :id
          map "object", to: :object
          map "created", using: {from: :from_timestamp, to: :to_timestamp}
          map "model", to: :model
          map "system_fingerprint", to: :system_fingerprint
          map "choices", to: :choices
          map "usage", to: :usage
        end
      end
    end
  end
end
