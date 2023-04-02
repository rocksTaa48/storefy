Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root "pages#index"
  resources :categories
  resources :subcategories
  resources :products

  get 'cart', to: 'cart#show'
  post 'cart/add'
  post 'cart/remove'

  resources :orders, only: %i[destroy] do
    collection do
      post :checked
    end
  end

end
