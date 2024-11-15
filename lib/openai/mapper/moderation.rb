# typed: false

module Openai
  module Mapper
    class Moderation < ::Openai::Mapper::BaseMapper
      attribute :id, ::Shale::Type::String
      attribute :model, ::Shale::Type::String
      attribute :results, ::Openai::Mapper::ModerationResults, collection: true

      json do
        map "data", to: :data
        map "object", to: :object
        map "deleted", to: :deleted
      end
    end
  end
end
