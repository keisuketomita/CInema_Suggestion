Rails.application.routes.draw do
  root 'cinemas#index'
  # root to: 'users#show'
  devise_for :users
  resources :cinemas
  resources :users, only: [:index, :new, :edit, :update, :show]
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
