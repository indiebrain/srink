require "rails_helper"

describe SHA1TokenService do

  it "returns a token" do
    input = "input"
    service = SHA1TokenService.new(input: input,
                                  salt: "salt")

    salted_input = "salt" + input
    expected_token = Digest::SHA1.new.hexdigest(salted_input)[0..10]
    expect(service.token).
      to eq(expected_token)
  end

  it "returns a different token for the same input whent the input is salted with different values" do
    input = "input"
    first_token = SHA1TokenService.new(input: input,
                                       salt: Time.now.tv_nsec.to_s).token
    second_token = SHA1TokenService.new(input: input,
                                        salt: Time.now.tv_nsec.to_s).token

    expect(first_token).
      to_not eq(second_token)
  end
end
