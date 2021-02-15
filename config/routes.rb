Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  root 'cinemas#index'
  # root to: 'users#show'
  resources :relationships, only: [:create, :destroy]
  devise_for :users
  resources :cinemas
  resources :users, only: [:index, :new, :edit, :update, :show]
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
