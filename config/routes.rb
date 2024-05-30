Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    resources :pomo_sessions, only: [:index, :create]
    post '/signup', to: 'users#create'
    get '/me', to: 'users#show'
    patch '/me', to: 'users#update'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'

    get '/ai-analyzer', to: 'openai#index'
  end
end
