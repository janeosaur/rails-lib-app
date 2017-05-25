class UsersController < ApplicationController

  # before_action :logged_in?, only: [:show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    login(@user)
    redirect_to @user
  end

  def show
    # @user = User.find (params[:id])
    # below is for logged_in?
    if current_user == params[:id]
    # if session[:user_id] == params[:id]
      @user = User.find(params[:id])
      render :show
    else
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
