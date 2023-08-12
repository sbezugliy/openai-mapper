# typed: false

module Openai
  module Mapper
    class Model < BaseMapper
      attribute :id, ::Shale::Type::String
      attribute :object, ::Shale::Type::String
      attribute :root, ::Shale::Type::String
      attribute :parent, ::Shale::Type::String
      attribute :created, ::Shale::Type::Time
      attribute :owned_by, ::Shale::Type::String
      attribute :permission, ::Openai::Mapper::ModelPermission, collection: true

      json do
        map "id", to: :id
        map "object", to: :object
        map "root", to: :root
        map "parent", to: :parent
        map "owned_by", to: :owned_by
        map "permission", to: :permission

        map "created", using: {from: :from_timestamp, to: :to_timestamp}
      end
    end
  end
end
