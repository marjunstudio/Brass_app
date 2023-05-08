class SearchResultController < ApplicationController
  skip_before_action :require_login
  
  def index
    @music = Music.ransack(params[:q])
    @musics = @music.result
  end

  def show
    @music = Music.find(params[:id])
    @comment = Comment.new
    @comments = Comment.where(music_id: params[:id])
  end
end