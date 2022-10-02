class Api::V1::TasksController < ApplicationController
  #before_action :set_pos, omly: [:show, :update, :destroy]
  protect_from_forgery 
  def index
    tasks = Task.order(created_at: :desc)
    render json: { status: 'SUCCESS', message: 'Loaded tasks', data: tasks }
  end

  def create_test
    Task.create(post_params)
  end

  private
  def post_params
    params.require(:task).permit(:title)
  end
end
