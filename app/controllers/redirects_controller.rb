class RedirectsController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def show
    link = Link.where(token: params[:id]).first
    if link.present?
      redirect_to link.url
    else
      redirect_to "/404.html"
    end
  end
end
