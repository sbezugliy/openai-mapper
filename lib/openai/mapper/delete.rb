# typed: false

module Openai
  module Mapper
    class Delete < ::Openai::Mapper::BaseMapper
      attribute :data, ::Openai::Mapper::File, collection: true
      attribute :object, ::Shale::Type::String
      attribute :deleted, ::Shale::Type::Boolean

      json do
        map "data", to: :data
        map "object", to: :object
        map "deleted", to: :deleted
      end
    end
  end
end
