class FakeTokenGenerator

  def initialize(input:,
                salt: "")
    @input = input
  end

  def token
    "token for #{input}"
  end

  private
  attr_reader :input
end
