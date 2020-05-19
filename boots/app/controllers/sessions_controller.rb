class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(userid: params[:userid].downcase)
    if user && user.authenticate(params[:password])
      log_in user
      redirect_to posts_path
    else
      flash.now[:danger] = '아이디 또는 비밀번호가 틀렸습니다.'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url

  end
end
