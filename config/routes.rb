Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  get '/member-data', to: 'members#show'

  namespace :api do
    resources :books, only: [:index, :show, :create, :destroy]
    resources :reservations
  end
end
