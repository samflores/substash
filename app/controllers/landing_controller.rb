class LandingController < ApplicationController
  def index
    if user_signed_in?
      @subtitles = Subtitle.newest
    else
      @subtitles = Subtitle.top_downloads
    end
  end
end
