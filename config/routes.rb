Baseapp::Application.routes.draw do

  # The front end site
  
  get "pages/index"
  
  devise_for :users, :path_names => { :sign_in => 'login', :sign_up => 'new', :sign_out => 'logout', :password => 'password', :confirmation => 'confirmation' }
  
  # When we log in a user through Devise, redirect them to the dashboard
  
  match '/user', :to => 'dashboards#index', :as => :user_root
  
  # Project dashboard
  
  match 'dashboard', :to => 'dashboards#index'
  
  # Resource routes
  resources :accounts
  resources :projects
  resources :issues
  resources :uploads
  resources :clients
  resources :tasks
  resources :invoices
  
  match 'uploads/:user_id/share/:id', :to => 'uploads#share' 
  match 'invoices/view/:id', :to => 'invoices#view' 
  
  # API 
  
  namespace :api_v1 do
    scope ':key' do
      resources :projects
    end
  end
     
  # Default route
  
  root :to => redirect("/users/login")

end
