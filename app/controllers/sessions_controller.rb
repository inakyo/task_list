class SessionsController < ApplicationController
  def new
    if session[:user_name]
      flash[:notice] = "#{session[:user_name]}でログインしています"
      redirect_to :tasks 
    end
  end

  def create
    if params.key?(:name) || params.key?(:password)
      user = User.find_by(name: params[:name])
      if user && user.authenticate(params[:password])
        session[:user_name] = params[:name]
        flash[:SUCCESS] = "#{session[:user_name]}でログインしました"
        redirect_to :tasks
      else
        flash[:FAILED] = "ログインに失敗しました"
        render 'new'
      end
    end
  end
  
  def destroy
    flash[:SUCCESS] = "ログアウトしました"
    session[:user_name] = nil
    render :new
  end
end
