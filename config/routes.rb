Rails.application.routes.draw do
  root 'root#index'

  resources :bonds
end
