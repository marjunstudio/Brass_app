class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: %i[index guide]
  before_action :set_category
  before_action :set_composer
  before_action :set_music
  before_action :medal_set

  def index
    @music_like_ranks = Music.find(Like.group(:music_id).order('count(music_id) DESC').limit(5).pluck(:music_id))

    @like_count = 0 #いいねの最大値用変数
    @medal_rank = [] #順位の配列

    @music_like_ranks.each_with_index do |music, i|
      if i == 0 #1位の配列処理
        @medal_rank.push(i)
        @like_count = Like.where(music_id: music.id).count      
      elsif Like.where(music_id: music.id).count < @like_count #いいね数が最大数よりも少ない場合
        @medal_rank.push(@medal_rank.length)
      else #ひとつ前の順位と同じいいね数の場合
        @medal_rank.push(@medal_rank.min)
      end
    end
  end

  def guide;end

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

  def set_category
    @category = Category.ransack(params[:q])
    @categories = @category.result
  end
  
  def set_composer
    @composer = Composer.ransack(params[:q])
    @composers = @composer.result
  end
  
  def set_music
    @music = Music.ransack(params[:q])
    @musics = @music.result.includes(:composer)
  end
end