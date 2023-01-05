class SearchResultController < ApplicationController
  def index
    @q = Music.ransack(params[:q])
    @musics = @q.result
    @category = Category.where(category_id: @q)
  end
end