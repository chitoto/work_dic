class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id), notice: "ログインしました!"
    else
      flash.now[:notice] = 'ログインに失敗しました'
      render :new
    end
  end

  def show
  end

  def destroy
      session.delete(:user_id)
      redirect_to new_session_path, notice: "ログアウトしました!"
  end
end
