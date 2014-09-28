Rails.application.routes.draw do
  devise_for :users

  resources :images do
    resources :favourites, except: [:index]
    resources :comments, except: [:index]
  end
  resources :users do
    member do
      get 'show_images'
      get 'show_favourites'
    end
  end

  root 'images#index'

  get 'about' => 'pages#about'
end
