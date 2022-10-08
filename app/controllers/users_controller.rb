class UsersController < ApplicationController
  before_action :check_role

  def index
#    if session[:role] != 0
#      redirect_to :tasks#index
#    end
    @users=User.all
  end

  def show
    @user=User.find(params[:id])
  end

  def new
    @user=User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save  
      flash[:SUCCESS] = "#{params[:user][:name]}ユーザを作成しました。"
      redirect_to :tasks
    else
      flash[:FAILRE] = "ユーザを作成しました。#{}"
      redirect_to :users#new
    end
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    User.update()
    redirect_to :tasks#index
  end

  def destroy
  end

  private

  def check_role
    
  end

  def user_params
    params.require(:user).permit(:name, :password, :role)
  end

end
