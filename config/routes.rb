Rails.application.routes.draw do
  
  namespace :users_backoffice do
    get 'welcome/index'
    get 'transactions/index'
    post 'transactions/tranfer', to: 'transactions#transfer', as:'transfer'
  end
  namespace :admins_backoffice do
    get 'welcome/index'
    patch '/requests/:id', to: 'requests#update_status', as: 'update_status'
    resources :requests
  end

  namespace :site_backoffice do
    resources :deposits
    resources :withdrawals
    get 'balance/index'
    post 'withdrawals/amount_value', to: 'withdrawals#amount_value'
    post 'withdrawals/to_withdraw', to: 'withdrawals#to_withdraw'
    get 'withdrawals/show', to: 'withdrawals#show'
    get 'welcome/index'
  end

  devise_for :users
  devise_for :admins

  root to: 'site_backoffice/welcome#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
