# typed: false

module Openai
  module Mapper
    class Usage < BaseMapper
      attribute :prompt_tokens, ::Shale::Type::Integer
      attribute :completion_tokens, ::Shale::Type::Integer
      attribute :total_tokens, ::Shale::Type::Integer
    end
  end
end
