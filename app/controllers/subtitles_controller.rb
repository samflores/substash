class SubtitlesController < ApplicationController
  def show
    @subtitle = Subtitle.find(params[:id])
  end
end
