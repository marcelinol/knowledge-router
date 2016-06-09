Rails.application.routes.draw do
  root 'materials#new'

  resources :materials
  resources :users
end
