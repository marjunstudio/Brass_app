class LikesController < ApplicationController
  before_action :require_login, only: %i[index create destroy]

  def index
    like_musics = current_user.likes.includes(:music)
    @like_musics = Music.joins(:likes).distinct
  end

  def create
    likes = Like.new(user_id: current_user.id, music_id: params[:format])
    likes.save
    redirect_back fallback_location: search_result_index_path
  end

  def destroy
    like_music = current_user.likes.find_by(music_id: params[:id])
    current_user.unlikes_music(like_music)
    redirect_back fallback_location: search_result_index_path, success: t('.success')
  end

  private

  def params_like
    params.require(:likes).permit(:music_id)
  end
end
