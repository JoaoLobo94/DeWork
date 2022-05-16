Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources 'users', except: %i[destroy create edit update index] do
        post 'send_transaction' => 'users#create_transaction'
        get 'check_balance' => 'users#balance'
      end
      resources :companies, except: [:destroy] do
        get 'check_balance' => 'companies#balance'
        get 'send_transaction' => 'companies#create_transaction'
        resources :contributions, except: [:destroy] do
          resources :replies, except: [:destroy, :show, :edit]
          resources :participation_requests, only: [:create, :index] do
            get 'accept_participation' => 'participation_requests#accept_participation'
          end
          post 'vote' => 'contributions#vote_on_value'
          get 'user_contributions' => 'companies#index_user_contributions'
          get 'check_balance' => 'contributions#balance'
          get 'add_user' => 'contributions#add_user_to_contribution'
          get 'start_work' => 'contributions#accept_start_work_contribution'
          get 'merge_request' => 'contributions#accept_finished_contribution'
        end
      end
      get 'user_companies' => 'companies#index_user_companies'
    end
  end
end
