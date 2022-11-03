# coding: utf-8

class TasksController < ApplicationController
  before_action :check_session
  before_action :check_current_user

  def index
    @current_user
    @tasks = @current_user.tasks.all
  end

  def show
    unless @current_user.tasks.exists?(params[:id])
      flash[:FAILED] = "タスクが存在しません"
      return redirect_to tasks_path
    else
      @task = Task.find(params[:id])
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = @current_user.tasks.new(post_params)
    if @task.save
      flash[:SUCCESS] = "#{params[:task][:title]}タスクを作成しました"
      redirect_to "/tasks"
    else
      flash[:FAILED] = "タスク作成に失敗しました"
      redirect_to controller: :tasks, action: :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    Task.update()
    redirect_to "/task"
  end

  def destroy
    unless @current_user.tasks.exists?(params[:id])
      flash[:FAILED] = "タスク削除に失敗しました"
      return redirect_to tasks_path
    end

    if Task.destroy(params[:id])
      flash[:SUCCESS] = "#{params[:task][:title]}タスクを削除しました"
      redirect_to "/tasks"
    else
      flash[:FAILED] = "タスク削除に失敗しました"
      redirect_to tasks_path
    end
  end

  private

  def check_session
    redirect_to "/login" unless session[:username].presence
  end

  def check_current_user
    @current_user = User.find_by(name: session[:username])
  end

  def post_params
    params.require(:task).permit(:title, :content)
  end
end
