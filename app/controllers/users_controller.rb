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

  def update
    @user = current_user

    if @user.update(reset_params)
      redirect_to home_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :reset_password
    end
  end

  def destroy
    User.find(params[id]).destroy

    redirect_to new_user_url
  end

  def forgot_password_page
    render :forgot_password_page
  end

  def forgot_password
    user = User.find_by_email(forgot_params[:email])
    token = user.set_forgot_token!
    message = UserMailer.password_reset_email(user)
    message.deliver
    # token = current_user.set_forgot_token!
#     message = UserMailer.password_reset_email(current_user)
#     message.deliver

    render :email_sent
  end

  def confirm_identity_page
    sign_out_user if signed_in?

    render :confirm_identity_page
  end

  def confirm_identity
    user = User.find_by_credentials(user_params[:email], user_params[:password])
    unless user.nil?
      if params[:token] == user.forgot_token
        token = user.set_forgot_token!
        redirect_to reset_password_url(token)
      else
        flash.now[:errors] = ["Incorrect reset URL."]
        render :email_sent
      end
    end
  end

  def reset_password
    if params[:token] == current_user.forgot_token
      current_user.forgot_token = nil
      render :reset_password
    else
      flash.now[:errors] = ["Incorrect reset URL."]
      render :email_sent
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def reset_params
    params.require(:user).permit(:password)
  end

  def forgot_params
    params.require(:forgot).permit(:email)
  end
end
