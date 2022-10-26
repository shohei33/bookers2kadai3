Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#top'

  get 'home/about' => 'home#about'




  resources :users, only: [:show, :index, :new, :edit, :update]

  resources :books, only: [:index, :new, :create, :show, :edit, :destroy, :update]

  resources :relationships, only: [:index, :create, :destroy]

end