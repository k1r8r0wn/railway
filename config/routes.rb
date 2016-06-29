Rails.application.routes.draw do
  get 'welcome/index'

  root 'welcome#index'

  resources :trains, :routes, :carriages, :tickets
  resources :stations do
    patch :update_position, on: :member
  end
end
