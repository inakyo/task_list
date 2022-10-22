class UsersController < ApplicationController
  before_action :check_role, only: [:index]

  def index
    p "userrole" + @userrole
    case @userrole
    when "admin" then
      @users=User.all
    when "user" then
      flash[:ERROR] = "権限がありません"
      redirect_to :tasks
    else
      flash[:ERROR] = "ログインしてください"
      redirect_to :tasks
    end
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
    @userrole = User.find_by(name: session[:username]).role
  end

  def user_params
    params.require(:user).permit(:name, :password, :role)
  end

end
