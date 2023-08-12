# typed: false

module Openai
  module Mapper
    class Models < BaseMapper
      attribute :object, ::Shale::Type::String
      attribute :data, ::Openai::Mapper::Model, collection: true
    end
  end
end
