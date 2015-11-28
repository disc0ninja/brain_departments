class DepartmentsController < ApplicationController
  before_action :set_department, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  #INDEX
  def index
    @departments = Department.all
  end

  #NEW
  def new
    @department = Department.new

  end

  #EDIT
  def edit
  end

  #CREATE
  def create
    @department = Department.new(department_params)
    @department.user = current_user
    if @department.save
      flash[:success]="Department successfully saved!"
      redirect_to department_path(@department)
    else
      render 'new'
    end
  end

  #UPDATE
  def update

    if @department.update(department_params)
      flash[:success] = "Department updated"
      redirect_to department_path(@department)
    else
      render 'edit'
    end
  end

  #SHOW
  def show

  end

  #DESTROY
  def destroy
    @department.destroy
    flash[:danger] = 'Department has been deleted'
    redirect_to departments_path
  end

  #Define department_params
  private
    def department_params
      params.require(:department).permit(:title, :description, category_ids: [])
    end

  #define require same
  def require_same_user
    if current_user != @department.user and !current_user.admin?
      flash[:danger] = "You must be a department owner to do that"
    end
  end

  def set_department
    @department = Department.find(params[:id])
  end

end