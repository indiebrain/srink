require 'rails_helper'

describe Link do

  it "requires a url" do

    expect(Link.new).
      to validate_presence_of(:url)
  end

  it "requires a valid url" do
    link = Link.new(url: "not-a-valid-url")
    expect(link).
      to be_invalid
  end
end
