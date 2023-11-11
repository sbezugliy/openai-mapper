# typed: false

module Openai
  module Mapper
    module Files
      class List < ::Openai::Mapper::BaseMapper
        attribute :data, ::Openai::Mapper::File, collection: true
        attribute :object, ::Shale::Type::String, default: -> { "list" }

        json do
          map "data", to: :data
          map "object", to: :object
        end
      end
    end
  end
end
