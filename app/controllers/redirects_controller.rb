class RedirectsController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def show
    service = RedirectService.new(params[:token])
    redirect_to service.url
  end
end
