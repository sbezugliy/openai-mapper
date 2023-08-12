# typed: false

module Openai
  module Mapper
    module Choices
      class MessageChoices < BaseMapper
        attribute :index, ::Shale::Type::Integer
        attribute :finish_reason, ::Shale::Type::String
        attribute :delta, ::Openai::Mapper::Message, default: -> {}
        attribute :message, ::Openai::Mapper::Message, default: -> {}
      end
    end
  end
end
