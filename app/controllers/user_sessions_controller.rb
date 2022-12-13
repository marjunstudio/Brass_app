class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_back_or_to(root_path, notice: 'ログイン成功')
    else
      flash.now[:alert] = 'ログイン失敗'
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
