# typed: false

module Openai
  module Mapper
    class Tool < ::Openai::Mapper::BaseMapper
      attribute :type, ::Shale::Type::String

      json do
        map "type", to: :type
      end
    end
  end
end
