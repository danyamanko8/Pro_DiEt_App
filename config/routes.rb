Rails.application.routes.draw do
  devise_for :users

  scope module: 'public_api' do
    root 'home#homepage'
    get 'homepage', to: 'home#homepage'
    get 'public_diets', to: 'public_diets#index'
    get 'public_diets/:id', to: 'public_diets#show'
  end

  scope module: 'private_api' do
    get 'user/:used_id/homepage', to: 'user_home#homepage'
    resources :diets
    resources :meals
  end
end
