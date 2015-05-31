class LinksController < ApplicationController
  before_action :require_login

  def new
    @link = Link.new
  end

  def create
    @link = current_user.links.build(link_attributes)
    if @link.valid?
      digester = Digest::SHA1.new
      @link.token = digester.hexdigest(@link.url)[0..10]
      @link.save
      redirect_to link_path(@link)
    else
      flash[:error] = @link.errors.full_messages.join("\n")
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  private
  def link_attributes
    params.
      require(:link).
      permit(:url)
  end
end
