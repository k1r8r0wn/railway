Rails.application.routes.draw do
  get 'welcome/index'

  root 'welcome#index'

  resources :tickets, :stations

  resources :routes do
    resources :waypoints, only: [:update]
  end
  
  resources :trains do
    resources :carriages, shallow: true
  end
end
