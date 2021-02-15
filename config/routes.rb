Rails.application.routes.draw do
  devise_for :users
  root 'cinemas#index'
  # root 'devise/registrations#new'
  resources :cinemas
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
