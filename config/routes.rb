Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/auth/facebook/callback' => 'sessions#create'

  get '/oldest_family_member', to: 'users#oldest'

  resources :users do
    resources :family_members
    resources :subscriptions
    resources :priority_items
    resources :disciplines
    resources :inspirations
    resources :objectives do
      resources :quests
    end
  end

  get '/users/:id/my_life', to: 'users#my_life'
  get '/users/:id/user_data', to: 'users#user_data'
  get '/subscriptions/:id/subscriptions_data', to: 'subscriptions#subscriptions_data'

end
