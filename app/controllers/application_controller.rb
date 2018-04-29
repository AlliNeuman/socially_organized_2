class ApplicationController < ActionController::Base
  #use protect_from_forgery to prevent CSRF attacks and raise exception
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_logged_in
    redirect_to login_path unless current_user
  end


end
