# typed: false

module Openai
  module Mapper
    class Choices < ::Openai::Mapper::BaseMapper
      attribute :index, ::Shale::Type::Integer
      attribute :finish_reason, ::Shale::Type::String
      attribute :logprobs, ::Shale::Type::String, default: -> {}
      attribute :delta, ::Openai::Mapper::Message, default: -> {}
      attribute :text, ::Shale::Type::String, default: -> {}
      attribute :message, ::Openai::Mapper::Message, default: -> {}

      json do
        map "index", to: :index
        map "finish_reason", to: :finish_reason
        map "delta", to: :object
        map "message", to: :message
        map "logprobs", to: :logprobs
        map "text", to: :text
      end
    end
  end
end
