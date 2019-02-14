class RedirectsController < ActionController::Base
  def show
    redirect_to RedirectProcess.new(params[:token]).call
  end
end
