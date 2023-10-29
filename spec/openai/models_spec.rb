# typed: false

require "spec_helper"

RSpec.describe Openai::Models, tag: :request do
  subject!(:connection) { described_class.new }

  let(:body) { File.read(File.join(__dir__, "../mocks/resource/model.json")) }

  let(:resource) do
    connection.request
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

  it { expect(resource).to be_a(Openai::Mapper::Models) }
  it { expect(resource.data[0]).to be_a(Openai::Mapper::Model) }
end
