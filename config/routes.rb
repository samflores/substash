Substash::Application.routes.draw do
  devise_for :users

  get "landing/index"

  root :to => 'landing#index'
end
