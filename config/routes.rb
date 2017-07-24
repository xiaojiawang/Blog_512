Rails.application.routes.draw do
  get 'welcome/home'
  root 'welcome#home'
  match 'sign_in', to: 'sessions#new', as: :sign_in, via: [:get]
  match 'sign_out', to: 'sessions#destroy', as: :sign_out, via: [:get]

  # match 'photos', to: 'photos#show', via: [:get, :post]

  resources :sessions, only: [:new, :create, :destroy]
  resources :articles
  resources :users
  
end
