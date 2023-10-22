# typed: false

module Openai
  module Mapper
    class Models < ::Openai::Mapper::BaseMapper
      attribute :object, ::Shale::Type::String
      attribute :data, ::Openai::Mapper::Model, collection: true

      json do
        map "object", to: :object
        map "data", to: :data
      end
    end
  end
end
