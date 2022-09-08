Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#top'

  get 'home/about' => 'home#index'




  resources :users, only: [:show, :index, :new, :edit, :update] do
    member do
    get :following, :followers
    end
  end



  resources :books, only: [:index, :new, :create, :show, :edit, :destroy, :update] do
  	resource :favorites, only: [:create, :destroy]
  	resource :comments, only: [:create, :destroy]
  end

  resources :relationships, only: [:index, :create, :destroy]

end