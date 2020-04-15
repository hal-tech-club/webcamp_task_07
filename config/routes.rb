Rails.application.routes.draw do
  root 'home#index'
  get 'home/about', to: 'home#about', as: 'home_about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
