class SubtitlesController < ApplicationController
  def show
    @subtitle = Subtitle.find(params[:id])
  end

  def download
    subtitle = Subtitle.find(params[:id])
    if subtitle.file.current_path
      subtitle.update_attributes :downloads => (subtitle.downloads + 1)
      send_file subtitle.file.current_path,
        :filename => "#{subtitle.episode.show.title}-S#{subtitle.episode.season}E#{subtitle.episode.number}.zip", 
        :type => "application/zip", :x_sendfile => true
    end
  end

  def new
    @subtitle = Subtitle.new
  end

  def create
    @subtitle = Subtitle.new(params[:subtitle])
    if @subtitle.save
      redirect_to @subtitle
    else
      render :new
    end
  end
end
