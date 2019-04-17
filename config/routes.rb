Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: %i(index update)
      resources :buddies, only: %i(create destroy update)
      resources :messages, only: %i(create)
      resources :workouts, only: %i(create)
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      get '/buddies', to: 'users#buddies'
    end
  end
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
