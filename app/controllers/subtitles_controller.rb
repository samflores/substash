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
end
