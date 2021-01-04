Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' } 
  resources :posts
  match '/users/:id', :to => 'users#update', :as => :user, via: :patch
  root "posts#index"
end