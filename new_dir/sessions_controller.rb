class SessionsController < ApplicationController

  #new session
  def new

  end

  #create session

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have successfully logged in"
      redirect_to users_path(user)
    else
      flash.now[:danger] = "Incorrect email or password"
      render 'new'
    end
  end

  #destroy session
  def destroy
    session[:user_id] = nil
    flash[:success] = "You are now logged out"
    redirect_to root_path

  end


end