# typed: false

module Openai
  module Mapper
    class ModerationResults < ::Openai::Mapper::BaseMapper
      attribute :flagged, ::Shale::Type::Boolean
      attribute :categories, ::Openai::Mapper::Categories
      attribute :category_scores, ::Openai::Mapper::CategoryScores

      json do
        map "flagged", to: :flagged
        map "categories", to: :categories
        map "category_scores", to: :category_scores
      end
    end
  end
end
