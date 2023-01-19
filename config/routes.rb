Rails.application.routes.draw do

  namespace :users_backoffice do
    resources :deposits
    resources :withdrawals
    resources :extracts
    get 'transactions/index'
    get 'balance/index'
    post 'transactions/tranfer', to: 'transactions#transfer', as:'transfer'
  end
  namespace :admins_backoffice do
    get 'welcome/index'
    patch '/requests/:id', to: 'requests#update_status', as: 'update_status'
    resources :requests
  end

  namespace :users_backoffice do
    get 'welcome/index'
  end

  devise_for :users
  devise_for :admins

  root to: 'site/welcome#index'
  get 'inicio', to: 'site/welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
