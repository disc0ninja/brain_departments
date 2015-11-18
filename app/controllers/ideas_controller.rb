class IdeasController < ApplicationController
  before_action :set_idea, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  #INDEX
  def index
    @ideas = Idea.all
  end

  #NEW
  def new
    @idea = Idea.new

  end

  #EDIT
  def edit
  end

  #CREATE
  def create
    @idea = Idea.new(idea_params)
    @idea.user = current_user
    if @idea.save
      flash[:success]="Department successfully saved!"
      redirect_to idea_path(@idea)
    else
      render 'new'
    end
  end

  #UPDATE
  def update

    if @idea.update(idea_params)
      flash[:success] = "Department updated"
      redirect_to idea_path(@idea)
    else
      render 'edit'
    end
  end

  #SHOW
  def show

  end

  #DESTROY
  def destroy
    @idea.destroy
    flash[:danger] = 'Department has been deleted'
    redirect_to ideas_path
  end

  #Define idea_params
  private
    def idea_params
      params.require(:idea).permit(:title, :description)
    end

  #define require same
  def require_same_user
    if current_user != @idea.user and !current_user.admin?
      flash[:danger] = "You must be a department owner to do that"
    end
  end

  def set_idea
    @idea = Idea.find(params[:id])
  end

end