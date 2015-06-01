class SHA1TokenService

  def initialize(input)
    @input = input
  end

  def token
    @token ||= sha[take_character_range]
  end

  private
  attr_reader :input

  def sha
    @sha ||= Digest::SHA1.new.hexdigest(input)
  end

  def take_character_range
    0..10
  end
end
