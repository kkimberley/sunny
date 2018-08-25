Rails.application.routes.draw do
  get 'landing/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # mount Api::Cost => '/api'
  root "dashboards#index"

  resources :costs
  resources :items
  resources :dashboards
end
