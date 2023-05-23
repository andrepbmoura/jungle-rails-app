class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate_with_credentials(params[:email], params[:password])

    if user
      log_in(user)
      redirect_to root_path, notice: 'Logged in successfully!'
    else
      redirect_to login_path, alert: 'Invalid email or password.'
    end
  end

  def destroy
    log_out
    redirect_to login_path, notice: 'Logged out successfully!'
  end

  private

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session[:user_id] = nil
  end
end
