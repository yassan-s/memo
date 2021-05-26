Rails.application.routes.draw do

  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # top画面
  root 'home#top'

  resources :tweets do
    resource :favorites, only: [:create, :destroy]
  end

end
