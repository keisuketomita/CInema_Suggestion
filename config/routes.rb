Rails.application.routes.draw do
  root to: 'cinemas#index'
  resources :cinemas
end
