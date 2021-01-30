Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :lectures, only: [:index, :show, :edit, :update, :new, :create] do
    resources :schoolings, only: [:new, :create]
    resources :blocks, only:  [:create]
  end

  resources :schoolings, only: [:index ]

end
