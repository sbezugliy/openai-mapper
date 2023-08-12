# typed: false

require "spec_helper"

RSpec.describe Openai::Resource::Models, tag: :request do
  subject!(:connection) { described_class.new }

  let(:body) { File.read(File.join(__dir__, "../../mocks/resource/model.json")) }

  let(:resource) do
    connection.resource
    connection
  end

  before do
    stub_request(:get, "https://api.openai.com/v1/models")
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
  it { expect(resource.data).to be_a(Openai::Mapper::Models) }
  it { expect(resource.data.data[0]).to be_a(Openai::Mapper::Model) }
end
