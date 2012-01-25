Baseapp::Application.routes.draw do
  
  devise_for :users, :path_names => { :sign_in => 'login', :sign_up => 'new', :sign_out => 'logout', :password => 'password', :confirmation => 'confirmation' }
  
  # When we log in a user through Devise, redirect them to the dashboard
  authenticate :user do
    root :to => "dashboards#index"
  end
  
  resources :projects
  
  get "pages/index"
  get "dashboards/index"
  
  root :to => 'pages#index'

end
