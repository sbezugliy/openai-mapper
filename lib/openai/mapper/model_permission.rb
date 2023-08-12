# typed: false

module Openai
  module Mapper
    class ModelPermission < BaseMapper
      attribute :id, ::Shale::Type::String
      attribute :object, ::Shale::Type::String
      attribute :created, ::Shale::Type::Time
      attribute :allow_create_engine, ::Shale::Type::Boolean
      attribute :allow_sampling, ::Shale::Type::Boolean
      attribute :allow_logprobs, ::Shale::Type::Boolean
      attribute :allow_search_indices, ::Shale::Type::Boolean
      attribute :allow_view, ::Shale::Type::Boolean
      attribute :allow_fine_tuning, ::Shale::Type::Boolean
      attribute :organisation, ::Shale::Type::String
      attribute :group, ::Shale::Type::String
      attribute :is_blocking, ::Shale::Type::Boolean

      json do
        map "id", to: :id
        map "object", to: :object
        map "allow_create_engine", to: :allow_create_engine
        map "allow_sampling", to: :allow_sampling
        map "allow_logprobs", to: :allow_logprobs
        map "allow_search_indices", to: :allow_search_indices
        map "allow_view", to: :allow_view
        map "allow_fine_tuning", to: :allow_fine_tuning
        map "organisation", to: :organisation
        map "group", to: :group
        map "is_blocking", to: :is_blocking
        map "created", using: {from: :from_timestamp, to: :to_timestamp}
      end
    end
  end
end
