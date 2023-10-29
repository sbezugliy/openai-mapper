
# typed: false

module Openai
  module Mapper
    module Images
      class Image < ::Openai::Mapper::BaseMapper
        attribute :url, ::Shale::Type::String
        attribute :b64_json, ::Shale::Type::String, default: -> { nil }

        json do
          map "url", to: :url
          map "b64_json", to: :b64_json
        end
      end
    end
  end
end
