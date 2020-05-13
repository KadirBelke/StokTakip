Rails.application.routes.draw do
  root to: 'dashboard#index'
  devise_for :users

  resources :storage,  only: %i[index create update destroy]
  resources :materials,  only: %i[create update destroy]
  get 'storage/:id/material', to: "materials#index", as: 'materials_index'
end
