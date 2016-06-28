Rails.application.routes.draw do
  get 'welcome/index'

  root 'welcome#index'

  resources :stations, :trains, :routes, :carriages
end
