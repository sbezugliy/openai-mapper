# typed: false

module Openai
  module Mapper
    class Usage < ::Openai::Mapper::BaseMapper
      attribute :prompt_tokens, ::Shale::Type::Integer
      attribute :completion_tokens, ::Shale::Type::Integer
      attribute :total_tokens, ::Shale::Type::Integer

      json do
        map "prompt_tokens", to: :prompt_tokens
        map "completion_tokens", to: :completion_tokens
        map "total_tokens", to: :total_tokens
      end
    end
  end
end
