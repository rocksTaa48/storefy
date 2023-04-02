Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root "pages#index"
  resources :categories
  resources :subcategories
  resources :products
end
