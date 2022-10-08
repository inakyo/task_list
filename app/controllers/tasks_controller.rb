class TasksController < ApplicationController
before_action :check_user

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
    @task = Task.new(post_params)
    if @task.save
    flash[:SUCCESS] = "#{params[:task][:title]}タスクを作成しました"
    redirect_to '/tasks'
    else
      flash[:FAILED] = "タスク作成に失敗しました"
      redirect_to controller: :tasks, action: :new
    end
  end

  def edit
    @task=Task.find(params[:id])
  end

  def update
    @task=Task.find(params[:id])
    Task.update()
    redirect_to '/task'
  end

  def destroy
  end

  private
  def check_user
    redirect_to '/login' unless session[:user_name].presence
  end

  def post_params
    params.require(:task).permit(:title, :content)
  end

end

