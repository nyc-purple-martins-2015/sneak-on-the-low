class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = 'Welcome back'

      redirect_to root_path
    else
      flash.now[:warning] = 'Invalid username/password combination. Please try again.'
      render :new
    end
  end
end
