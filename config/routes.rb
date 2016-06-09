Rails.application.routes.draw do
  get 'pocket_account/connect'

  root 'materials#new'

  resources :materials
  resources :users
end
