Substash::Application.routes.draw do
  devise_for :users

  match "subtitles/:id.zip" => 'subtitles#download', :as => 'subtitle_download'
  resources :subtitles

  get "landing/index"

  root :to => 'landing#index'
end
