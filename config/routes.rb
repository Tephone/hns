Rails.application.routes.draw do
  #get 'posts/index'
  resources :posts
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root 'posts#index'
end
