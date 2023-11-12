# typed: false

module Openai
  module Mapper
    class ImageFile < ::Openai::Mapper::BaseMapper
      attribute :file_id, ::Shale::Type::String

      json do
        map "file_id", to: :file_id
      end
    end
  end
end
