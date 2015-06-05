class SHA1TokenService

  def initialize(input:,
                 salt: "")
    @input = input
    @salt = salt
  end

  def token
    @token ||= sha[take_character_range]
  end

  private
  attr_reader :input,
    :salt

  def sha
    @sha ||= Digest::SHA1.new.hexdigest(salted_input)
  end

  def salted_input
    salt + input
  end

  def take_character_range
    0..10
  end
end
