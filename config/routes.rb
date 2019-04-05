Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: %i(index)
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      get '/buddies', to: 'users#buddies'
      get '/buddies/messages', to: 'buddies#messages'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
