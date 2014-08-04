class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    auth_user = sign_in_user(@user)

    if auth_user
      redirect_to home_url
    else
      flash.now[:errors] = ["Incorrect email and/or password."]
      render :new
    end
  end

  def destroy
    sign_out_user
    redirect_to new_session_url
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

end
