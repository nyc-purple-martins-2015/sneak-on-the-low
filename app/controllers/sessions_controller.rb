class SessionsController < ApplicationController
  def destroy
    session[:user_id] = nil
    redirect_to questions_path
  end

  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: params[:user][:username])
    if user.password == params[:user][:password]
      session[:user_id] = user.user_id

      redirect_to questions_path
    else
      redirect_to login_path
    end
  end
end
