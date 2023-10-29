# typed: false

RSpec.describe Openai::Chat::Completions, tag: :mapper do
  subject(:mapping) { described_class.new(**params) }

  let(:params) do
    {
      model: "gpt-3.5-turbo",
      messages: ([
        Openai::Mapper::Message.new(
          role: "system",
          content: "Hi."
        ),
        Openai::Mapper::Message.new(
          role: "user",
          content: "Hello!"
        )
      ])
    }
  end

  it { expect(mapping.to_json).to eq({}) }
end
