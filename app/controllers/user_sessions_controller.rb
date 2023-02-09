class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_to root_path, success: t('.success')
    else
      flash.now[:warning] = t('.warning')
      render :new
    end
  end

  def destroy
    logout
    redirect_to login_path, success: t('.success')
  end
end
