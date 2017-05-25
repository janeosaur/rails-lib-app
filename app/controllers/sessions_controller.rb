class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:email, :password)
    @user = User.confirm(user_params)
    if @user
      login(@user)
      flash[:notice] = "You're logged in!"
      redirect_to  @user
    else
      flash[:error] = "Wrong email/password combo!"
      redirect_to login_path
    end
  end

  def destroy
    logout
    flash[:notice] = "You've logged out!"
    redirect_to root_path
  end


end
