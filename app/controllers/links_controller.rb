class LinksController < ApplicationController
  before_action :require_login


  def create
    service = LinkCreateService.new(user: current_user,
                                    link_attributes: link_attributes)
    @link = service.link
    if service.create
      redirect_to links_path
    else
      flash[:error] = service.error_messages
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @links = current_user.links
  end

  def new
    @link = Link.new
  end

  private
  def link_attributes
    params.
      require(:link).
      permit(:url)
  end
end
