Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  get '/member-data', to: 'members#show'

  post '/verify', to: 'users#verify'

  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  namespace :api do
    resources :books, only: [:index, :show, :create, :destroy]
    resources :reservations, only: [:index, :create]
  end
end
