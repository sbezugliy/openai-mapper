# typed: false

module Openai
  module Request
    module Images
      class Edit < ::Openai::Mapper::BaseMapper
        attribute :image, ::Shale::Type::String
        attribute :prompt, ::Shale::Type::String
        attribute :mask, ::Shale::Type::String
        attribute :n, ::Shale::Type::Integer, default: -> { 1 }
        attribute :size, ::Shale::Type::String, default: -> { "1024x1024" }
        attribute :response_format, ::Shale::Type::String, default: -> { "url" }
        attribute :user, ::Shale::Type::String, default: -> {}
      end
    end
  end
end
