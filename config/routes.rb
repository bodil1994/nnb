Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_for :users, # Routes for authentication
           :controllers => { :registrations => 'users/registrations' },
           :path => 'user',
           :path_names => { :sign_in => 'login',
                            :sign_up => 'sign-up',
                            :sign_out => 'logout',
                            :password => 'password',
                            :confirmation => 'confirmation' }


  root to: "pages#home"  # Root route to the home page

  get "/dashboard-lender", to: "pages#lender_dashboard" # Route to lender dashboard
  get "/dashboard-borrower", to: "pages#borrower_dashboard" # Route to borrower dashboard
  get "/loan-summary-lender", to: "pages#lender_loan_summary" # Route to loan summary page during loan creation
  get "/transactions", to: "pages#transactions" # Route to transactions page
  get "/portfolio", to: "pages#portfolio" # Route to portfolio page

  resources :loans, only: [:new, :create, :index, :show] do
    resources :loan_requests, only: [:new, :create, :update]
  end

  resources :loan_requests, only: [] do
    get "/borrower-profile", to: "users#show"
  end

  resources :loan_requests, only: [:show, :update]
  resources :wallets, only: [:show, :update]
  resources :withdrawal_requests, only: [:new, :create, :show, :update]
  resources :deposits, only: [:new, :create, :show, :update] do
    patch "/accept", to: "deposit#accept"
  end

  resources :chatrooms, only: [:show] do
    resources :messages, only: :create
  end
end
