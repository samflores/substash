require 'spec_helper'

describe 'Landing Controller' do

  it 'should route / to landing#index' do
    {:get => '/'}.should route_to(:controller => 'landing', :action => 'index')
  end
end
