# typed: false

module Openai
  module Mapper
    class Categories < ::Openai::Mapper::BaseMapper
      attribute :sexual, ::Shale::Type::Boolean
      attribute :hate, ::Shale::Type::Boolean
      attribute :harassment, ::Shale::Type::Boolean
      attribute :self_harm, ::Shale::Type::Boolean
      attribute :sexual_minors, ::Shale::Type::Boolean
      attribute :hate_threatening, ::Shale::Type::Boolean
      attribute :violence_graphic, ::Shale::Type::Boolean
      attribute :self_harm_intent, ::Shale::Type::Boolean
      attribute :self_harm_instructions, ::Shale::Type::Boolean
      attribute :harassment_threatening, ::Shale::Type::Boolean
      attribute :violence, ::Shale::Type::Boolean

      json do
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
