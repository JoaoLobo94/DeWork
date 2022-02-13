Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :companies
  get 'user_companies' => 'companies#index_user_companies'
  resources :contributions
end
