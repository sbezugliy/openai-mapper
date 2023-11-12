# typed: false

module Openai
  module Mapper
    class Content < ::Openai::Mapper::BaseMapper
      attribute :type, ::Shale::Type::String
      attribute :image_file, ::Openai::Mapper::ImageFile
      attribute :text, ::Openai::Mapper::Text

      json do
        map "type", to: :type
        map "image_file", to: :image_file
        map "text", to: :text
      end
    end
  end
end
