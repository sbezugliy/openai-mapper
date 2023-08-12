# typed: false

module Openai
  module Mapper
    module Chat
      class Completion < BaseMapper
        attribute :id, ::Shale::Type::String
        attribute :object, ::Shale::Type::String
        attribute :created, ::Shale::Type::Time
        attribute :model, ::Shale::Type::String
        attribute :choices, ::Openai::Mapper::Choices, collection: true
        attribute :usage, ::Openai::Mapper::Usage
      end
    end
  end
end
