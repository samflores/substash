require 'spec_helper'

describe LandingController do

  describe "GET 'index'" do
    context "not logged in" do
      it "should retrieve the top downloaded subtitles" do
        subtitles = double
        Subtitle.should_receive(:top_downloads).and_return(subtitles)
        get :index
        assigns(:subtitles).should == subtitles
      end
    end
  end

end
