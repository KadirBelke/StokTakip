Rails.application.routes.draw do
  root to: 'dashboard#index'
  devise_for :users

  resources :storage,  only: %i[index create update destroy]
end
