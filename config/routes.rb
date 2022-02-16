Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :companies, except: [:destroy] do
        resources :contributions, except: [:destroy]
        get 'user_contributions' => 'companies#index_user_contributions'
      end
      get 'user_companies' => 'companies#index_user_companies'
    end
  end
end
