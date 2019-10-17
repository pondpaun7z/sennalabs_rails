Rails.application.routes.draw do
  root 'persons#index'
  resources :persons do
    resources :cars
  end
end
