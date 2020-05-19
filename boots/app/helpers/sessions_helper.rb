module SessionsHelper
  def log_in(user)
    session[:userid] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:userid])
  end

  def user_signed_in?
    !current_user.nil?
  end

  def log_out
    session[:userid] = nil
  end
end
