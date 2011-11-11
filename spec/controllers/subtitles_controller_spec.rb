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

  describe "GET 'download'" do
    before do
      @subtitle = mock_model(Subtitle, 
                             :file => stub(:current_path => 'foo'),
                             :downloads => 0,
                             :update_attributes => true,
                             :episode => stub(:number => 1, 
                                              :season => 2,
                                              :show => stub(:title => 'Foo')))
      subject.stub(:send_file)
      Subtitle.stub(:find => @subtitle)
    end

    it "should load the subtitle by its id" do
      Subtitle.should_receive(:find)
      get :download, :id => 42
    end

    it "should serve the zip file" do 
      subject.should_receive(:send_file).with("foo", {:filename => "Foo-S2E1.zip", :type => "application/zip", :x_sendfile => true})
      get :download, :id => 42
    end
  end

  describe "GET 'new'" do
    it "should create a new subtitle" do
      subtitle = double
      Subtitle.should_receive(:new).and_return(subtitle)
      get :new
      assigns(:subtitle).should == subtitle
    end
  end

  describe "POST 'create'" do
    before do
      @subtitle = mock_model(Subtitle, :save => true)
      Subtitle.stub(:new).and_return(@subtitle)
    end

    it "should create a new subtitle with the param received" do
      Subtitle.should_receive(:new).with('episode_id' => '1', 'file' => 'x')
      post :create, :subtitle => { :episode_id => 1, :file => 'x' }
    end

    context "with valid params" do
      it "should redirect to subtitle details" do
        @subtitle.should_receive(:save).and_return(true)
        post :create, :subtitle => { :episode_id => 1, :file => 'x' }
        response.should redirect_to(@subtitle)
      end
    end

    context "with invalid params" do
      it "should render the form again" do
        @subtitle.should_receive(:save).and_return(false)
        post :create, :subtitle => { :episode_id => 1, :file => 'x' }
        response.should render_template('new')
      end
    end
  end

end
