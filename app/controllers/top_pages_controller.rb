class TopPagesController < ApplicationController
  skip_before_action :require_login, only: %i[top]
  before_action :set_category
  before_action :set_composer
  before_action :set_music
  before_action :medal_set

  def top
    # @music_like_ranks = Like.includes(:user).sort {|a,b| b.user.size <=> a.user.size}
    @music_like_ranks = Music.find(Like.group(:music_id).order('count(music_id) DESC').limit(5).pluck(:music_id))
  end

  private

  def medal_set
    @medals = [
      '/images/gold_medal.png',
      '/images/silver_medal.png',
      '/images/copper_medal.png',
      '/images/fourth_medal.png',
      '/images/fifth_medal.png',
    ]
  end
end
