Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :lectures, only: [:index, :show, :edit, :update, :new, :create, :destroy] do
    resources :schoolings, only: [:new, :create, :destroy]
    resources :blocks, only:  [:create, :show, :edit, :new] do
      resources :flashcards, only:[:new, :create]
    end

  resources :schoolings, only: [:index, :destroy]
  end

  get '/dashboard', to: "pages#dashboard"
  get '/manage_courses', to: "pages#manage_courses"
  get '/test', to: "pages#test"
  get '/search', to:"pages#search"
end
