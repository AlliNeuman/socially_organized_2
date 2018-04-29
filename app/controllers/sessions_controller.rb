class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by_email(params[:email])
    #if the user exists and password entered is correct
    if @user && @user.authenticate(params[:password])
      #save user.id inside the browser cookie
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      #if user's login doesn't work, send them to login with error notice
      redirect_to login_path, alert: "Something went wrong, please try to login again."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, alert: "You have successfully logged out."
  end

end
