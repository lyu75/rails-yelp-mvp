Rails.application.routes.draw do
  resources :restaurants do
    resources :reviews, only: [:index, :new, :create]
  end
  resources :reviews, only: [:show, :edit, :update, :destroy]
  root to: 'restaurants#index'

  # get 'restaurants/index'
  # get 'restaurants/show'
  # get 'restaurants/edit'
  # get 'restaurants/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
