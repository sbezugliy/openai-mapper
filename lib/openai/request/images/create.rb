# typed: false

module Openai
  module Request
    module Images
      class Create < ::Openai::Mapper::BaseMapper
        attribute :prompt, ::Shale::Type::String
        attribute :response_format, ::Shale::Type::String, default: -> { "url" }
        attribute :n, ::Shale::Type::Integer, default: -> { 1 }
        attribute :size, ::Shale::Type::String, default: -> { nil }
        attribute :user, ::Shale::Type::String, default: -> { nil }
      end
    end
  end
end

