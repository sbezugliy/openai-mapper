# typed: false

module Openai
  module Mapper
    class BaseMapper < Shale::Mapper
      def from_timestamp(model, value)
        model.created = Time.at(value)
      end

      def to_timestamp(model, value)
        # value['created'] = model.created.to_i
        raise NotImplementedError
      end
    end
  end
end
