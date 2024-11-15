# typed: false

module Openai
  module Request
    module Images
      class Variations < ::Openai::Mapper::BaseMapper
        attribute :image, ::Shale::Type::String
        attribute :n, ::Shale::Type::Integer, default: -> { 1 }
        attribute :response_format, ::Shale::Type::String, default: -> { "url" }
        attribute :size, ::Shale::Type::String, default: -> { "1024x1024" }
        attribute :user, ::Shale::Type::String, default: -> {}
      end
    end
  end
end
