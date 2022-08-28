Rails.application.routes.draw do
  resources :diets
  devise_for :users
  root 'home#homepage'
  get 'homepage', to: 'home#homepage'
end
