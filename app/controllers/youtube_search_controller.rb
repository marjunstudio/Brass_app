class YoutubeSearchController < ApplicationController
  GOOGLE_API_KEY = Rails.application.credentials.google[:api_key]
  require 'google/apis/youtube_v3'
  
  def index
    @youtube_data = find_videos(params[:format])
  end

  def find_videos(keyword)
    service = Google::Apis::YoutubeV3::YouTubeService.new
    service.key = GOOGLE_API_KEY

    next_page_token = nil
    opt = {
      q: keyword,
      type: 'video',
      max_results: 10,
      order: :viewCount,
      page_token: next_page_token,
    }
    service.list_searches(:snippet, opt)
  end
end
