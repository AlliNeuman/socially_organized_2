class ApplicationController < ActionController::Base
  #use protect_from_forgery to prevent CSRF attacks and raise exception
  protect_from_forgery with: :exception
  before_action :current_user

  def current_user
    @user = (User.find_by(id: session[:user_id]) || User.new)
  end

  def logged_in?
    current_user.id != nil

  def authorize
    redirect_to login_path unless logged_in?
  end


end
