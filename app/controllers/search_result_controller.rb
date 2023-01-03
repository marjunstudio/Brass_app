class SearchResultController < ApplicationController
  def index
    @q = Music.ransack(params[:q])
    @musics = @q.result
  end
end