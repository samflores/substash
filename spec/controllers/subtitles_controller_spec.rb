require 'spec_helper'

describe SubtitlesController do

  describe "GET 'show'" do
    it "should load the subtitle by its id" do
      subtitle = stub
      Subtitle.should_receive(:find).and_return(subtitle)
      get :show, :id => 42
      assigns(:subtitle).should == subtitle
    end
  end

end
