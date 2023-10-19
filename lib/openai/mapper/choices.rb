# typed: false

module Openai
  module Mapper
    class Choices < BaseMapper
      attribute :index, ::Shale::Type::Integer
      attribute :finish_reason, ::Shale::Type::String
      attribute :logprobs, ::Shale::Type::String, default: -> {nil}
      attribute :delta, ::Openai::Mapper::Message, default: -> {nil}
      attribute :text, ::Shale::Type::String, default: -> {nil}
      attribute :message, ::Openai::Mapper::Message, default: -> {nil}

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
