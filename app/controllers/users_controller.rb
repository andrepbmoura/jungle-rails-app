class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # Create a new user based on the submitted parameters
    @user = User.new(user_params)

    if @user.save
      # Sign in the user
      sign_in(@user)

      # Redirect to the desired location after successful sign-up
      redirect_to '/'
    else
      # If the user couldn't be saved, render the new template again
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def sign_in(user)
    session[:user_id] = user.id
  end
end
