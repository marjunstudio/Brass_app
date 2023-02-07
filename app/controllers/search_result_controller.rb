class SearchResultController < ApplicationController
  skip_before_action :require_login
  before_action :set_music, only: %i[category composer]
  before_action :set_category, only: %i[category]
  before_action :set_composer, only: %i[composer]
  
  def index;end

  def category
    @q = params[:q].values
    @musics = MusicCategory.where(category_id: @q)
  end

  def composer
    @q = params[:q].values
    @musics = Music.where(composer_id: @q)
  end

  def word_search
    @music = Music.ransack(params[:q])
    @musics = @music.result
  end
end