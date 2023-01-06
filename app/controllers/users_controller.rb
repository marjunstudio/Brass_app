class UsersController < ApplicationController
  before_action :set_user, only: %i[index edit update]
  skip_before_action :require_login, only: [:index, :new, :create]

  def index
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, success:'新規ユーザーを登録しました'
    else
      flash.now[:warning] = '新規ユーザーの作成に失敗しました'
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :crypted_password)
  end

  def set_user
    @user = User.find(current_user.id)
  end
end
