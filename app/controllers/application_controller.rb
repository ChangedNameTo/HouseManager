class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  rescue_from ActionController::InvalidAuthenticityToken do |exception|
    session.delete(:user_id)
    redirect_to root_path
  end
end
