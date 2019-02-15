require 'rails_helper'

describe Link do

  it "requires a url" do
    expect(described_class.new).
      to validate_presence_of(:url)
  end

  it "requires a valid url" do
    link = described_class.new(url: "not-a-valid-url")
    expect(link).
      to be_invalid
  end

  it "has many visits" do
    expect(described_class.new)
      .to have_many(:visits)
  end
end
