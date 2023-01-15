class LikesMusicController < ApplicationController
  def index
  end

  def create
    @likes_musics = Likes_music.new(params_like)
    @likes_musics.save
    redirect_to search_result_index_path
  end

  def destroy
  end

  private

  def params_like
    params.require(likes_music).permit(:user_id, :music_id)
  end
end
