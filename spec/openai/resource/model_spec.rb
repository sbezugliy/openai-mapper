# typed: false

require "spec_helper"

RSpec.describe Openai::Resource::Model, tag: :request do
  subject!(:connection) { described_class.new }

  let(:body) { File.read(File.join(__dir__, "../../mocks/resource/model_text-davinci-001.json")) }

  let(:resource) do
    connection.resource("text-davinci-001")
    connection
  end

  before do
    stub_request(:get, "https://api.openai.com/v1/models/text-davinci-001")
      .with(
        headers: {
          "Authorization" => "Bearer #{OPENAI_TOKEN}",
          "Content-Type" => "application/json",
          "Host" => "api.openai.com:443"
        }
      )
      .to_return(status: 200, body: body, headers: {})
  end

  it { expect(resource.response.body).to eq(body) }
  it { expect(resource.response.status).to be(200) }
  it { expect(resource.data).to be_a(Openai::Mapper::Model) }
end
