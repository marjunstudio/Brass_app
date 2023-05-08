class SearchResultController < ApplicationController
  skip_before_action :require_login
  
  def index
    @music = Music.ransack(params[:q])
    @musics = @music.result
  end

  def show
    @music = Music.find(params[:id])
  end
end