Rails.application.routes.draw do
  root to: 'storage#index'
  devise_for :users

  resources :users, only: %i[index update]
  patch 'password_update/:id', to: "users#update_password", as: "password_update"
  resources :storage,  only: %i[index create update destroy]
  resources :materials,  only: %i[create update destroy]
  get 'storage/:id/materials', to: "materials#index", as: 'materials_index'
  patch 'storage/:id/piece', to: "materials#piece_update", as: 'piece_update'
  get 'reports', to: "reports#index"
end
