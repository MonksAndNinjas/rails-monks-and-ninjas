Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/auth/facebook/callback' => 'sessions#create'

  resources :users, only: [:show, :edit, :update]
  resources :subscriptions, only: [:index, :new, :create, :destroy]
  resources :priority_items, only: [:index, :new, :create, :destroy]
  resources :disciplines, only: [:index, :new, :create, :destroy]
  resources :inspirations, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  resources :objectives, only: [:index] do
    resources :quests, only: [:new, :create, :edit, :update, :destroy]
  end

end
