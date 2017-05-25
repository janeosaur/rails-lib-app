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
    # implicit return:
    # if someone's logged in... let them see profile page.
    # if not... (current user = nil).. redirect to root
    # if @current_user
    #   redirect_to user_path(current_user)
    # else
    #   redirect_to root_path
    # end

    #to check whether there is a current user.
    !current_user.nil?
  end

end
