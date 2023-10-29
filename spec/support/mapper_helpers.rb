# typed: false

module MapperHelpers
  class StubTypeMapper < ::Openai::Mapper::BaseMapper
    attribute :method_name, ::Shale::Type::String
    attribute :args, ::Shale::Type::String, default: -> { {type: "object", properties: {}} }
  end

  class StubMapper < ::Openai::Mapper::BaseMapper
    attribute :name, ::Shale::Type::String
    attribute :amount, ::Shale::Type::Integer
    attribute :function, StubTypeMapper, default: -> {}
  end
end
