Rails.application.routes.draw do
  devise_for :users
  root to:"items#index"
  resources :items, only:[:new,:create,:show,:edit]
  resources :products, only:[:create,:update,:destroy]
end
