Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items ,only: [:index, :new, :create, :show] do
    #resources :items, only: [:get]
  end
  
  resources :users
end
