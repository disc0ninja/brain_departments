class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]
   #index
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  #create
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to Brain-Departments #{@user.username}"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  #edit
  def edit

  end

  #update
  def update

    if @user.update(user_params)
      flash[:success] = "Your account was updated successfully"
      redirect_to ideas_path
    else
      render 'edit'
    end
  end
  #show
  def show

  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:danger] = "User and all departments have been deleted"
    redirect_to users_path
  end

  def set_user
     @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user and !current_user.admin?
      flash[:danger] = "You must be account owner"
      redirect_to root_path
    end
  end
  
  def require_admin
    if logged_in? and !current_user.admin?
      flash[:danger] = "You must be an admin"
      redirect_to root_path
  end
  



  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end