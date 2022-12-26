class TopPagesController < ApplicationController
  skip_before_action :require_login, only: [:top, :index]

  def index
    @categories = Category.all
    @musics = Music.all
  end
end
