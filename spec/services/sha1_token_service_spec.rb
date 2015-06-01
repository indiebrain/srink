require "rails_helper"

describe SHA1TokenService do

  it "returns a token" do
    input = "input"
    service = SHA1TokenService.new(input)

    expected_token = Digest::SHA1.new.hexdigest(input)[0..10]
    expect(service.token).
      to eq(expected_token)
  end
end
