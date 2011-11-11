require 'spec_helper'

feature 'Landing page' do
  scenario 'no subtitles' do
    visit '/'
    page.should have_content('No subtitles yet. Would you like to upload one now?')
  end

  context do

    background do
      @data = [
        {:show => "Dexter"              , :season => 6  , :episode => 6  , :downloads => 13 , :date => 2.days.ago}  ,
        {:show => "Fringe"              , :season => 4  , :episode => 4  , :downloads => 12 , :date => 1.days.ago}  ,
        {:show => "Once Upon a Time"    , :season => 1  , :episode => 2  , :downloads => 11 , :date => 10.days.ago} ,
        {:show => "Grimm"               , :season => 1  , :episode => 1  , :downloads => 10 , :date => 9.days.ago}  ,
        {:show => "The Walking Dead"    , :season => 2  , :episode => 3  , :downloads => 9  , :date => 5.days.ago}  ,
        {:show => "ThunderCats"         , :season => 1  , :episode => 9  , :downloads => 8  , :date => 3.days.ago}  ,
        {:show => "Man Up!"             , :season => 1  , :episode => 4  , :downloads => 7  , :date => 11.days.ago} ,
        {:show => "The Big Bang Theory" , :season => 5  , :episode => 8  , :downloads => 6  , :date => 7.days.ago}  ,
        {:show => "The Clone Wars"      , :season => 4  , :episode => 7  , :downloads => 5  , :date => 6.days.ago}  ,
        {:show => "Doctor Who"          , :season => 6  , :episode => 13 , :downloads => 4  , :date => 3.days.ago}  ,
        {:show => "The Simpsons"        , :season => 21 , :episode => 5  , :downloads => 3  , :date => 4.days.ago}  ,
        {:show => "White Collar"        , :season => 2  , :episode => 10 , :downloads => 2  , :date => 8.days.ago}
      ]
      @data.each do |data|
        show = Show.create :title => data[:show]
        episode = Episode.create :show => show, :number => data[:episode], :season => data[:season]
        Subtitle.create :episode => episode, :downloads => data[:downloads], :updated_at => data[:date]
      end
      User.create :email => 'john@mail.com', :password => 'sekret', :password_confirmation => 'sekret'
    end

    scenario 'not logged in' do
      visit '/'
      within('div.container') do
        page.should have_content('Top Downloads')
        @data[0, 10].each do |item|
          page.should have_content(item[:show])
          page.should have_content("Season #{item[:season]} Episode #{item[:episode]}")
        end
        @data[-2, 2].each do |item|
          page.should_not have_content(item[:show])
        end
      end
    end

    scenario 'logged in' do
      visit '/users/sign_in'
      fill_in 'Email', :with => 'john@mail.com'
      fill_in 'Password', :with => 'sekret'
      click_button 'Sign in'

      visit '/'
      within('div.container') do
        page.should have_content('Newest')
        @data.sort! { |a, b| b[:date] <=> a[:date] }
        @data[0, 10].each do |item|
          page.should have_content(item[:show])
          page.should have_content("Season #{item[:season]} Episode #{item[:episode]}")
        end
        @data[-2, 2].each do |item|
          page.should_not have_content(item[:show])
        end
      end
    end

  end
end
