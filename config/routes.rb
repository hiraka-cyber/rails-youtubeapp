Rails.application.routes.draw do
  devise_for :users
  root 'movies#index'
  resources :movies do
    resources :comments
    resources :likes
  end
  resources :users do
    member do
     get :subscribe, :subscribers
    end
  end
  resources :subscribes

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
