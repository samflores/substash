require 'spec_helper'

describe LandingController do

  describe "GET 'index'" do
    context "not signed in" do
      it "should retrieve the top downloaded subtitles" do
        subject.stub(:user_signed_in? => false)
        subtitles = double
        Subtitle.should_receive(:top_downloads).and_return(subtitles)
        get :index
        assigns(:subtitles).should == subtitles
      end
    end

    context "signed in" do
      it "should retrieve the latest subtitles" do
        subject.stub(:user_signed_in? => true)
        subtitles = double
        Subtitle.should_receive(:newest).and_return(subtitles)
        get :index
        assigns(:subtitles).should == subtitles
      end
    end
  end

end
