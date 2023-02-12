class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, success: t('.success')
    else
      flash.now[:warning] = t('.warning')
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :crypted_password)
  end
end
