class LikesMusicController < ApplicationController
  before_action :logged_in?, only: %i[create destroy]

  def index
  end

  def create
    likes_musics = LikesMusic.new(user_id: current_user.id, music_id: params[:format])
    likes_musics.save
    redirect_to search_result_index_path
  end

  def destroy
    like_music = current_user.likes_musics.find_by(music_id: params[:id])
    current_user.unlikes_music(like_music)
    redirect_to search_result_index_path
  end

  private

  def params_like
    params.require(:likes_music).permit(:music_id)
  end
end
