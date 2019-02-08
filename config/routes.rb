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
  get '/family_members/:id/family_members_data', to: 'family_members#family_members_data'
  get '/subscriptions/:id/subscriptions_data', to: 'subscriptions#subscriptions_data'
  get '/priority_items/:id/priority_items_data', to: 'priority_items#priority_items_data'
  get '/disciplines/:id/disciplines_data', to: 'disciplines#disciplines_data'
  get '/inspirations/:id/inspirations_data', to: 'inspirations#inspirations_data'
  get '/quests/:id/quests_data', to: 'quests#quests_data'

end
