class IdeasController < ApplicationController

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
    if @idea.save
      flash[:notice]="Idea successfully saved!"
      redirect_to idea_path(@idea)
    else
      render 'new'
    end
  end

  #UPDATE
  def update

  end

  #SHOW
  def show
    @idea =Idea.find(params[:id])
  end

  #Define idea_params
  private
    def idea_params
      params.require(:idea).permit(:title, :description)
    end

end