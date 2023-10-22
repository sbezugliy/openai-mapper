
# typed: false

module Openai
  module Mapper
    module Images
      class List < ::Openai::Mapper::BaseMapper
        attribute :data, ::Openai::Mapper::Images::Image, collection: true
        attribute :created, ::Shale::Type::Time


        json do
          map "data", to: :data
          map "created", using: {from: :from_timestamp, to: :to_timestamp}
        end
      end
    end
  end
end
