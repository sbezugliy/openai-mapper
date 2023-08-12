# typed: false

module Openai
  class Arguments
    attr_accessor :mapper, :params, :body

    def initialize(request_mapper, **params)
      @mapper = request_mapper
      @params = params
      build_body
    end

    private

    def build_body
      @obj = @mapper.new(**@params)
      @body = @obj.to_json
    end
  end
end
