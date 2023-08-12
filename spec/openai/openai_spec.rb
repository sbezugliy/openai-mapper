# typed: false
# frozen_string_literal: true

RSpec.describe Openai do
  it "has a version number" do
    expect(Openai::VERSION).not_to be_nil
  end
end
