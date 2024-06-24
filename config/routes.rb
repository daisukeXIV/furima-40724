Rails.application.routes.draw do
  devise_for :users
  root to:"items#index"
  resources :items, only:[:new,:create,:show,:edit]do
    resources :orders, only:[:index,:create]
  end
  resources :products, only:[:create,:update,:destroy] 
end
