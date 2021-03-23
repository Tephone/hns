Rails.application.routes.draw do
  root 'posts#index'
  resources :posts do
    resources :comments
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
    #get 'users', to: 'users/registrations#create'
    get 'users/favorites', to: 'users/registrations#favorites_index'
    get 'users/own_posts', to: 'users/registrations#own_posts_index'
    get 'users/own_posts_pictures', to: 'users/registrations#own_posts_pictures_index'
  end
  resources :favorites, only: [:create, :destroy]
  resources :horse_diaries

end
