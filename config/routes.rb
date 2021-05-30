Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # top画面
  root 'home#top'

  resources :tweets do
    resource :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  get 'favorites/create'
  get 'favorites/destroy'

end
