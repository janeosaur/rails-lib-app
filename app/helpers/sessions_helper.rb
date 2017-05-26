module SessionsHelper

  def login(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_id session[:user_id]
  end

  def logout
    @current_user = session[:user_id] = nil
  end

  def logged_in?
    if current_user.nil?
      flash[:error] = "sorry you must be logged in"
      redirect_to root_path
    end
  end

  def require_ownership
    if current_user.nil? || current_user.id != params[:id].to_i
      flash[:error] = "you don't have access to this page"
      redirect_to user_path(current_user.id)
    end
    # if current_user.id == params[:id].to_i
    #   @user = User.find(params[:id])
    #   render :show
    # else
    #   redirect_to root_path
    # end
  end

end
