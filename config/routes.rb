Rails.application.routes.draw do
  # devise_for :users
  devise_for :users,
           :controllers => { :registrations => 'users/registrations' },
           :path => 'user',
           :path_names => { :sign_in => 'login',
                            :sign_up => 'sign-up',
                            :sign_out => 'logout',
                            :password => 'password',
                            :confirmation => 'confirmation' }
  root to: "pages#home"
  get "/dashboard-lender", to: "pages#lender_dashboard"
  get "/dashboard-borrower", to: "pages#borrower_dashboard"
  get "/loan-summary-lender", to: "pages#lender_loan_summary"
  get "/transactions", to: "pages#transactions"
  get "/portfolio", to: "pages#portfolio"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :loans, only: [:new, :create, :index, :show] do
    resources :loan_requests, only: [:new, :create, :update]
  end

  resources :loan_requests, only: [] do
    get "/user", to: "users#show"
  end

  resources :loan_requests, only: [:show, :update]
  resources :wallets, only: [:show, :update]
  resources :withdrawal_requests, only: [:new, :create, :show, :update]
  resources :deposits, only: [:new, :create, :show, :update]
end
