class RedirectService

  def initialize(token)
    @token = token
  end

  def url
    if link.present? then link.url else not_found_url end
  end

  private
  attr_reader :token

  def link
    @link ||= Link.where(token: token).first
  end

  def not_found_url
    "/404.html"
  end
end
