Rails.application.routes.draw do
  resources :rankings
  resources :schedules
  resources :dayoffs
  root 'schedules#index'
  
end
