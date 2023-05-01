Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
  }

  root "pages#index"
  resources :categories
  resources :subcategories
  resources :products

  resources :users, only: %i[show], param: :id do
    resource :cart, controller: 'cart', only: %i[show]
  end

  post 'cart/add'
  post 'cart/remove'
  get 'users/:user_id/products'=> 'products#user_products', as: :user_products

  resources :orders, only: %i[destroy] do
    collection do
      post :checked
    end
  end

end
