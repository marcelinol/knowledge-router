Rails.application.routes.draw do
  devise_for :users
  get 'pocket/connect', to: 'pocket_account#connect', as: :connect_pocket
  get 'pocket/new', to: 'pocket_account#new', as: :new_pocket_account
  get 'pocket-callback', to: 'pocket_account#callback', as: :pocket_callback

  root 'materials#new'

  resources :materials
  resources :users
end
