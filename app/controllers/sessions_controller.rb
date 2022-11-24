class SessionsController < ApplicationController
  def new
    if session[:username]
      flash[:notice] = "#{session[:username]}でログインしています"
      redirect_to :tasks
    end
  end

  def create
    puts "#{session[:username]}でログインしています"
    if params.key?(:name) || params.key?(:password)
      user = User.find_by(name: params[:name])
      if user && user.authenticate(params[:password])
        session[:username] = user.name
        session[:userrole] = user.role
        flash[:SUCCESS] = "#{session[:username]}でログインしました"
        redirect_to :tasks
      else
        flash[:FAILED] = "ログインに失敗しました"
        render "new"
      end
    end
  end

  def destroy
    session.clear
    flash[:SUCCESS] = "ログアウトしました"
    p session[:userrole]
    redirect_to login_path
  end
end
