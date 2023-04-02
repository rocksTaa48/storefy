Rails.application.routes.draw do
  root "pages#index"
  resources :categories
  resources :subcategories
  resources :products
end
