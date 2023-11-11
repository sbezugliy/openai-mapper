# typed: false

module Openai
  module Mapper
    module Files
      class Delete < ::Openai::Mapper::BaseMapper
        attribute :data, ::Openai::Mapper::File, collection: true
        attribute :object, ::Shale::Type::String, default: -> { "file" }
        attribute :deleted, ::Shale::Type::Boolean

        json do
          map "data", to: :data
          map "object", to: :object
          map "deleted", to: :deleted
        end
      end
    end
  end
end
