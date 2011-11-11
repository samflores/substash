require 'spec_helper'

describe 'Subtitles Routing' do
  it "should route /subtitles/:id to subtitles#show" do
    {:get => '/subtitles/42'}.should route_to(:controller => 'subtitles', :action => 'show', :id => '42')
  end

  it "should route /subtitles/:id.zip to subtitles#download" do
    {:get => '/subtitles/42.zip'}.should route_to(:controller => 'subtitles', :action => 'download', :id => '42')
  end

  it "should route /subtitles/new to subtitles#new" do
    {:get => '/subtitles/new'}.should route_to(:controller => 'subtitles', 'action' => 'new')
  end

  it "should route POST to /subtitles to subtitles#create" do
    {:post => '/subtitles'}.should route_to(:controller => 'subtitles', 'action' => 'create')
  end
end
