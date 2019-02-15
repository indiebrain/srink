class RedirectProcess

  def initialize(token)
    @token = token
  end

  def call
    record_visit
    link.url
  end

  private
  attr_reader :token

  def link
    @link ||= Link.find_by(token: token) || UnknownLink
  end

  def record_visit
    link.visits.create unless link == UnknownLink
  end
end
