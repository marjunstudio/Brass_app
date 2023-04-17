class LikesController < ApplicationController
  before_action :require_login, only: %i[index create destroy]

  def index
    @musics = current_user.likes.includes(:music).map(&:music)
  end

  def create
    @like_music = Like.new(user_id: current_user.id, music_id: params[:format])
    @like_music.save
  end

  def destroy
    @like_music = current_user.likes.find_by(music_id: params[:id])
    current_user.unlikes_music(@like_music)
  end

  private

  def params_like
    params.require(:likes).permit(:music_id)
  end
end
