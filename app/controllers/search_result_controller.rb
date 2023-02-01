class SearchResultController < ApplicationController
  skip_before_action :require_login
  before_action :set_music
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
end