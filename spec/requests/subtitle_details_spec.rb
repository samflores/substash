require 'spec_helper'

feature 'Subtitles info' do
  background do 
    show = Show.create :title => 'Dexter'
    episode = Episode.create :show => show, :season => 6, :number => 6, :title => 'Sollicitudin Euismod Vestibulum'
    Subtitle.create :episode => episode, :downloads => 13, :updated_at => 2.days.ago, :file => File.open('tmp/file.zip')
  end

  scenario 'should display the show plot' do
    visit '/'
    click_link "Dexter Season 6 Episode 6"
    page.should have_content("Sollicitudin Euismod Vestibulum")
    page.should have_link("Download")
  end

  scenario 'should increment the download count when click download' do
    num_downloads = Subtitle.first.downloads
    visit '/'
    click_link "Dexter Season 6 Episode 6"
    click_link "Download"
    Subtitle.first.downloads.should == num_downloads + 1
  end
end
