class RedirectService

  def initialize(token)
    @token = token
  end

  def url
    link.url
  end

  private
  attr_reader :token

  def link
    if @link
      return @link
    end
    Link.where(token: token).first || NoLink.new
  end
end
