class UsersController < ApplicationController
  def new
    @users = User.all
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to posts_path
  end

  def destroy
  end

  private
    def user_params
      params.require(:user).permit(:userid, :password, :name, :email)
    end
end
