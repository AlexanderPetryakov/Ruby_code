Rails.application.routes.draw do
 
  devise_for :users
  

  resources :tickets, only: [:new, :show, :create]
  resource :search, only: [:show, :create]

  namespace :admin do

    resources :trains do
      resources :wagons, shallow: true
    end
  
    resources :railway_stations do
      patch :update_number, on: :member
      patch :update_time, on: :member
    end
  
    resources :routes
    resources :tickets
  end
  
  get 'welcome/index'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
