require 'spec_helper'

feature 'Subtitles info' do
  scenario 'should display the show plot' do
    show = Show.create :title => 'Dexter'
    episode = Episode.create :show => show, :season => 6, :number => 6, :title => 'Sollicitudin Euismod Vestibulum'
    Subtitle.create :episode => episode, :downloads => 13, :updated_at => 2.days.ago

    visit '/'
    click_link "Dexter Season 6 Episode 6"
    page.should have_content("Sollicitudin Euismod Vestibulum")
    page.should have_link("Download")
  end
end
