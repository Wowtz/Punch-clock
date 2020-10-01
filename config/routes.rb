Rails.application.routes.draw do
  resources :customers
  resources :rankings
  resources :schedules
  resources :dayoffs
  root 'schedules#index'
end
