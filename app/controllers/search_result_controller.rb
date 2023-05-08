class SearchResultController < ApplicationController
  skip_before_action :require_login
  
  def index
    @music = Music.ransack(params[:q])
    @musics = @music.result
  end

  def show
    @music = Music.includes(comments: :user).find(params[:id])
    @comment = Comment.new
    @comments = @music.comments.order(created_at: :desc)
  end
end