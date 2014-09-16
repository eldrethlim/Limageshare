Rails.application.routes.draw do
  devise_for :users
  resources :images
  root 'pages#home'
  get 'about' => 'pages#about'
end
