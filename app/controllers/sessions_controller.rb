class SessionsController < ApplicationController
  def new
    if session[:username]
      flash[:notice] = "#{session[:username]}でログインしています"
      redirect_to :tasks
    end
  end

  def create
    puts "#{session[:username]}でログインしています".encoding
    if params.key?(:name) || params.key?(:password)
      user = User.find_by(name: params[:name])
      if user && user.authenticate(params[:password])
        session[:username] = params[:name]
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
    #p "session=" + session
    redirect_to login_path
  end
end
