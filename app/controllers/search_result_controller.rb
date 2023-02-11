class SearchResultController < ApplicationController
  skip_before_action :require_login
  
  def index;end

  def word_search
    @music = Music.ransack(params[:q])
    @musics = @music.result
  end
end