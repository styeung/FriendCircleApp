class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :signed_in?

  def sign_in_user(user)
    auth_user = User.find_by_credentials(user.email, user.password)
    return nil if auth_user.nil?

    token = auth_user.reset_session_token!
    session[:token] = token

    auth_user
  end

  def current_user
    User.find_by_session_token(session[:token])
  end

  def signed_in?
    !!current_user
  end

  def sign_out_user
    current_user.reset_session_token!
    session[:token] = nil
  end
end
