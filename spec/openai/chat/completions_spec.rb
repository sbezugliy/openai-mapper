# typed: false

require "spec_helper"

RSpec.describe Openai::Chat::Completions, tag: :request do
  subject(:connection) { described_class.new }

  let(:body) { File.read(File.join(__dir__, "../../mocks/resource/completions_0001.json")) }

  let(:resource) {
    connection.request(params)
    connection
  }

  let(:params) do
    {
      model: "gpt-3.5-turbo",
      messages: [
        ::Openai::Mapper::Message.new(
          role: "system",
          content: "Hello from openai-mapper: https://github.com/sbezugliy/openai-mapper"
        ),
        ::Openai::Mapper::Message.new(
          role: "user",
          content: "Hello!"
        )
      ]
    }
  end

  before do
    stub_request(:post, "https://api.openai.com/v1/chat/completions")
      .with(
        body: "{\"model\":\"gpt-3.5-turbo\",\"messages\":[{\"role\":\"system\",\"content\":\"Hello from openai-mapper: https://github.com/sbezugliy/openai-mapper\"},{\"role\":\"user\",\"content\":\"Hello!\"}],\"temperature\":1.0,\"top_p\":1.0,\"n\":1,\"stream\":false,\"max_tokens\":5,\"presence_penalty\":0.0,\"frequency_penalty\":0.0}",
        headers: {
          "Content-Type" => "application/json",
          "Host" => "api.openai.com"
        }
      )
      .to_return(status: 200, body: body)
  end

  it { expect(resource.data).to be_a(Openai::Mapper::Chat::Completions) }
  it { expect(resource.data.choices[0]).to be_a(Openai::Mapper::Choices) }
  it { expect(resource.data.usage).to be_a(Openai::Mapper::Usage) }
end
