class SearchResultController < ApplicationController
  skip_before_action :require_login, only: %i[index]
  def index
    @q = Music.ransack(params[:q])
    @musics = @q.result
    @musics.each do |music|
      category = music.music_categories.select(:category_id)
      @category = Category.find_by(id: category).name
    end
    
  end
end