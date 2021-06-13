Rails.application.routes.draw do

  get 'relationships/create'
  get 'relationships/destroy'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  ##### top画面 #####
  root 'home#top'


  ##### user, relationship #####
  resources :users do
    resource :relationships, only: [:create, :destroy]
  end


  ##### tweet, comment, favorite #####
  resources :tweets do
    resource :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end


end
