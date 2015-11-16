class UsersController < ApplicationController

  def new
    @user = User.new
  end

  #create
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Brain-Departments #{@user.username}"
      redirect_to ideas_path
    else
      render 'new'
    end
  end

  #edit
  def edit
    @user = User.find(params[:id])
  end

  #update
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Your account was updated successfully"
      redirect_to ideas_path
    else
      render 'edit'
    end
  end


  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end