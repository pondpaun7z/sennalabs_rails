Rails.application.routes.draw do
  get 'cars/index'

  get 'cars/new'

  get 'cars/edit'

  get 'cars/show'

  root 'persons#index'
  resources :persons do
    resources :cars
  end
end
