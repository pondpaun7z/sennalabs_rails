Rails.application.routes.draw do
  root 'persons#report'
  resources :persons do
    get 'report', on: :collection

    resources :cars
  end
end
