class LandingController < ApplicationController
  def index
    @subtitles = Subtitle.top_downloads
  end
end
