class RedirectProcess

  def initialize(token)
    @token = token
  end

  def call
    link.url
  end

  private
  attr_reader :token

  def link
    @link ||= Link.find_by(token: token)|| NoLink.new
  end
end
