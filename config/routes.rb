require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  devise_for :users

  scope module: 'public_api' do
    root 'home#homepage'
    get 'public_diets', to: 'public_diets#index'
    get 'public_diets/new', to: 'public_diets#new'
    get 'public_diets/:id', to: 'public_diets#show', as: 'public_diet_show'
    post 'public_diets', to: 'public_diets#create', as: 'public_diet_create'
  end

  scope module: 'private_api' do
    get 'user/:used_id/homepage', to: 'user_home#homepage'
    post 'diets/:id/send_report', to: 'diets#send_report', as: 'diet_send_report'
    resources :diets
    resources :meals
  end
end
