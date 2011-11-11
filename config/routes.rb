Substash::Application.routes.draw do
  get "subtitles/show"

  devise_for :users
  resources :subtitles

  get "landing/index"

  root :to => 'landing#index'
end
