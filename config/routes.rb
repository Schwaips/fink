Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  resources :lectures, only: [:index, :show, :edit, :update, :new, :create, :destroy] do
    post '/message_slack', to: "lectures#message_slack"
    resources :schoolings, only: [:new, :create, :destroy]
    resources :blocks, only:  [:create, :show, :edit, :new, :update, :destroy] do
      resources :flashcards, only:[:new, :create]
    end

  resources :schoolings, only: [:index, :destroy]
  end

  get '/dashboard', to: "pages#dashboard"
  get '/manage_courses', to: "pages#manage_courses"
  get '/test', to: "pages#test"
  get '/search', to:"pages#search"

  get '/user_join_channel', to: "lectures#user_join_channel"
end
