class SearchResultController < ApplicationController
  skip_before_action :require_login, only: %i[index]
  def index
    @q = Music.ransack(params[:q])
    @musics = @q.result
    @category = Category.where(category_id: @q)
  end
end