Baseapp::Application.routes.draw do
  
  resources :clients

  get "pages/index"
  
  devise_for :users, :path_names => { :sign_in => 'login', :sign_up => 'new', :sign_out => 'logout', :password => 'password', :confirmation => 'confirmation' }
  
  # When we log in a user through Devise, redirect them to the dashboard
  match '/user', :to => "dashboards#index"
  
  # Project dashboard
  match "dashboard", :to => "dashboards#index"
  
  # Resource routes
  resources :projects
  resources :issues
    
  # Default route
  root :to => 'pages#index'

end
