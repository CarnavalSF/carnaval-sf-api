class SessionsController < ApplicationController
  before_action :ensure_logged_in, only: [:new]
  
  def new; end

  def create
    user = User.find_by(email: params[:email].downcase)

    if Services::User::Authenticate.new(user).call(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_url, success: 'Login successful.'
    else
      redirect_to login_url, error: 'Invalid email/password combination.'
    end
  end

  def destroy
    reset_session
    redirect_to root_url, success: 'Logged out!'
  end

  private

  def ensure_logged_in
    redirect_to dashboard_url if session[:user_id]
  end
end
