class YoutubeSearchController < ApplicationController
  require 'google/apis/youtube_v3'
  
  def index
    @youtube_data = find_videos(params[:format])
  end

  def find_videos(keyword)
    service = Google::Apis::YoutubeV3::YouTubeService.new
    service.key = Rails.application.credentials.google[:api_key]
    @youtube_data = []

    #動画情報を格納
    next_page_token = nil
    video_info = service.list_searches(
      :snippet,
      q: keyword,
      type: 'video',
      max_results: 10,
      order: :viewCount,
      page_token: next_page_token
    )

    video_info.items.each_with_index do |item, index|
      video_id = video_info.items[index].id.video_id
      video_results = service.list_videos(
        :statistics,
        id: video_id,
        max_results: 1
      )
      #動画ID,タイトル,概要, 再生回数を配列で取得
      view_count = video_results.items[0].statistics.view_count
      snippet = item.snippet

      @youtube_data << { 
        video_id: video_id, 
        title: snippet.title, 
        description: snippet.description, 
        published_at: snippet.published_at,
        view_count: view_count }
    end
  end
end
