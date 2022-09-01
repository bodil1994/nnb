Rails.application.routes.draw do
  # devise_for :users
  devise_for :users,
           :controllers => { :registrations => 'registrations' },
           :path => 'user',
           :path_names => { :sign_in => 'login',
                            :sign_up => 'sign-up',
                            :sign_out => 'logout',
                            :password => 'password',
                            :confirmation => 'confirmation' }
  root to: "pages#home"
  get "/dashboard-lender", to: "pages#lender_dashboard"
  get "/dashboard-borrower", to: "pages#borrower_dashboard"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :loans, only: [:new, :create, :index, :show] do
    resources :loan_requests, only: [:new, :create]
  end
  resources :loan_requests, only: [:show]
end
