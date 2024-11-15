module Openai
  module Request
    class Embedding < ::Openai::Mapper::BaseMapper
      attribute :input, ::Shale::Type::String
      attribute :model, ::Shale::Type::String
      attribute :encoding_format, ::Shale::Type::String
    end
  end
end
