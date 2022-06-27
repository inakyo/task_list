class TasksController < ApplicationController
  def index
    @tasks=Task.all
  end

  def show
    @task=Task.find(params[:id])
  end

  def new
    @task=Task.new
  end

  def create
    Task.create(post_params)
    redirect_to '/tasks/index'
  end

  def edit

  end



  def update
  end

  def destroy
  end

  private
  def post_params
    params.require(:task).permit(:title, :content)
  end

end

