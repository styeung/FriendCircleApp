class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in_user(@user)
      redirect_to home_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def destroy
    User.find(params[id]).destroy

    redirect_to new_user_url
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
