# typed: false

require "spec_helper"

RSpec.describe Openai::Request::Chat::Completion, tag: :request do
  subject!(:connection) { described_class.new(**params) }

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

  let(:resource) do
    connection.resource
    connection
  end

  # before do
  #   stub_request(:get, "https://api.openai.com/v1/chat/cmpletion")
  #     .with(
  #       headers: {
  #         "Authorization" => "Bearer #{OPENAI_TOKEN}",
  #         "Content-Type" => "application/json",
  #         "Host" => "api.openai.com:443"
  #       }
  #     )
  #     .to_return(status: 200, body: body, headers: {})
  # end

  it { expect(resource.data.body).to eq(body) }
  it { expect(resource.data.status).to be(200) }
  it { expect(resource.data).to be_a(Openai::Mapper::Chat::Completion) }
end
