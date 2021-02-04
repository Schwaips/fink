Rails.application.routes.draw do
  get 'flashcards/block_id'
  get 'flashcards/question'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :lectures, only: [:index, :show, :edit, :update, :new, :create] do
    resources :schoolings, only: [:new, :create]
    resources :blocks, only:  [:create] do
      resources :flashcards, only:[:create]
  end

  resources :schoolings, only: [:index ]

  get '/dashboard', to: "pages#dashboard"

end
end
