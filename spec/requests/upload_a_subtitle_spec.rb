require 'spec_helper'

feature 'Upload a subtitle' do
  scenario 'for an existing episode' do
    show = Show.create :title => 'Grimm'
    episode = Episode.new :show => show, :number => 2, :season => 1
    User.new :email => 'john@mail.com', :password => 'sekret', :password_confirmation => 'sekret'

    visit '/users/sign_in'
    fill_in 'Email', :with => 'john@mail.com'
    fill_in 'Password', :with => 'sekret'
    click_button 'Sign in'

    # click_link 'Upload subtitle'
    visit '/subtitles/new'
    fill_in 'Show', :with => 'Grimm'
    fill_in 'Episode', :with => 'Season 1 Episode 2'
    attach_file 'File', 'tmp/file.zip'
    click_button 'Save'

    page.should have_content('Subtitle uploaded successfully')
  end

end
