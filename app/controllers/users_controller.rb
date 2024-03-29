class UsersController < ApplicationController


  def dashboard
    @calendars = current_user.calendars
  end

  def new

  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      redirect_to signup_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
