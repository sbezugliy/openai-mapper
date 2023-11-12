# typed: false

module Openai
  module Mapper
    class Text < ::Openai::Mapper::BaseMapper
      attribute :value, ::Shale::Type::String
      attribute :annotations, ::Openai::Mapper::Annotation, collection: true

      json do
        map "value", to: :value
        map "annotations", to: :annotations
      end
    end
  end
end
