class ProfilesController < ApplicationController
  before_action :set_user, only: %i[update edit]
  skip_before_action :require_login, only: %i[edit update]
  
  def edit;end

  def update
    if @user.update(user_params)
      redirect_to profile_path, success: t('.success')
    else
      flash.now[:warning] = t('.warning')
      render :edit
    end
  end

  def show;end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
