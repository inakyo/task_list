class Api::V1::TasksController < ApplicationController
  def index
    tasks = Task.order(created_at: :desc)
    render json: { status: 'SUCCESS', message: 'Loaded posts', data: tasks }
  end
end
