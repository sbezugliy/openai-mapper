module Openai
  module Mapper
    class CategoryScores < ::Openai::Mapper::BaseMapper
      attribute :sexual, ::Shale::Type::String
      attribute :hate, ::Shale::Type::String
      attribute :harassment, ::Shale::Type::String
      attribute :self_harm, ::Shale::Type::String
      attribute :sexual_minors, ::Shale::Type::String
      attribute :hate_threatening, ::Shale::Type::String
      attribute :violence_graphic, ::Shale::Type::String
      attribute :self_harm_intent, ::Shale::Type::String
      attribute :self_harm_instructions, ::Shale::Type::String
      attribute :harassment_threatening, ::Shale::Type::String
      attribute :violence, ::Shale::Type::String

      json do
        map "sexual", to: :sexual
        map "hate", to: :hate
        map "harassment", to: :harassment
        map "self-harm", to: :self_harm
        map "sexual/minors", to: :sexual_minors
        map "hate/threatening", to: :hate_threatening
        map "violence/graphic", to: :violence_graphic
        map "self-harm/intent", to: :self_harm_intent
        map "self-harm/instructions", to: :self_harm_instructions
        map "harassment/threatening", to: :harassment_threatening
        map "violence", to: :violence
      end
    end
  end
end
