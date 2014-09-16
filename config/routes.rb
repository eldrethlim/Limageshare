Rails.application.routes.draw do
  devise_for :users

  resources :images
  resources :users do
    member do
      get 'show_images'
    end
  end

  root 'images#index'

  get 'about' => 'pages#about'
end
