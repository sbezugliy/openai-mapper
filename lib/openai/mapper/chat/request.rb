# typed: false

module Openai
  module Mapper
    module Chat
      class Request < BaseMapper
        attribute :model, ::Shale::Type::String
        attribute :messages, ::Openai::Mapper::Message, collection: true
        attribute :functions, ::Openai::Mapper::Functions, default: -> {}
        attribute :function_call, ::Openai::Mapper::Functions, default: -> {}
        attribute :temperature, ::Shale::Type::Float, default: -> { 1.0 } # Selector with top_p
        attribute :top_p, ::Shale::Type::Float, default: -> { 1.0 } # Selector with temperature
        attribute :n, ::Shale::Type::Integer, default: -> { 1 }
        attribute :stream, ::Shale::Type::Boolean, default: -> { false }
        attribute :stop, ::Shale::Type::String, default: -> {} # Selector of types
        attribute :max_tokens, ::Shale::Type::Integer, default: -> { 999 }
        attribute :presence_penalty, ::Shale::Type::Float, default: -> { 0 }
        attribute :frequency_penalty, ::Shale::Type::Float, default: -> { 0 }
        attribute :logit_bias, ::Shale::Type::String, default: -> {}
        attribute :user, ::Shale::Type::String, default: -> {}
      end
    end
  end
end
