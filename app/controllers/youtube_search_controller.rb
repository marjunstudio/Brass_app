class YoutubeSearchController < ApplicationController
  skip_before_action :require_login, only: %i[index ind_videos]
  require 'google/apis/youtube_v3'
  
  def index
    @youtube_data = find_videos(params[:format])
  end

  def find_videos(keyword)
    service = Google::Apis::YoutubeV3::YouTubeService.new
    service.key = Rails.application.credentials.google[:api_key]
    @youtube_data = []

    # 検索結果を取得
    search_results = service.list_searches(
      :snippet,
      type: "video",
      q: '吹奏楽' + keyword,
      max_results: 15,
      order: :viewCount,
      video_embeddable: true,
      fields: 'items(id(videoId), snippet(title, description, thumbnails(medium(url))))'
    )

    search_results.items.each_with_index do |item, index|
      video_id = search_results.items[index].id.video_id
      #動画の再生回数を取得する
      video_results = service.list_videos(
        :statistics,
        id: video_id,
        max_results: 1,
        fields: 'items(statistics(view_count))'
      )

      view_count = video_results.items[0].statistics.view_count
      snippet = item.snippet
      thumbnail = snippet.thumbnails.medium.url
      # { video_id・動画タイトル・概要・サムネ・再生回数 } を返す
      @youtube_data << { video_id: video_id, title: snippet.title, description: snippet.description, thumbnail: thumbnail, view_count: view_count }
    end
    return @youtube_data
  end
end
