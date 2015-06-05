class LinkCreateService
  attr_reader :link

  def initialize(user:,
                 link_attributes:,
                 token_generator_type: SHA1TokenService)
    @user = user
    @link = user.links.build(link_attributes)
    @token_generator = token_generator_type.new(input: link.url,
                                                salt: user.email + Time.now.tv_nsec.to_s)
  end

  def create
    if link.valid?
      link.token = token_generator.token
      return link.save
    end
    return false
  end

  def error_messages
    if link.invalid?
      link.errors.full_messages.join("\n")
    end
  end

  private
  attr_reader :user,
    :token_generator
end
