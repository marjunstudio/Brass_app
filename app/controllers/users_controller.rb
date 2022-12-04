class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.params(:email, :password)
  end
end
