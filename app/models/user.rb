class User < ApplicationRecord
  has_many :library_users, dependent: :destroy
  has_many :libraries, through: :library_users

  has_secure_password

  def self.confirm(params)
    @user = User.find_by(email: params[:email])
    @user ? @user.authenticate(params[:password]) : false
    # same as line above ...
    #@user.try(:authenticate, params[:password])
    #@user.authenticate(params[:password]) if @user
  end

end
