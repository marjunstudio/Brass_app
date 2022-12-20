class TopPagesController < ApplicationController
  skip_before_action :require_login, only: [:top, :index]
  def top
    @categories = Category.all
    @musics = Music.all
  end

  def index;end
end
