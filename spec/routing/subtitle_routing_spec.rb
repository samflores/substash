require 'spec_helper'

describe 'Subtitles Routing' do
  it "should route /subtitles/:id to subtitles#show" do
    {:get => '/subtitles/42'}.should route_to(:controller => 'subtitles', :action => 'show', :id => '42')
  end

  it "should route /subtitles/:id.zip to subtitles#download" do
    {:get => '/subtitles/42.zip'}.should route_to(:controller => 'subtitles', :action => 'download', :id => '42')
  end
end
