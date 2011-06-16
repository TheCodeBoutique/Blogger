# START:routes
Saveup::Application.routes.draw do |map|


 resources :blogs

# END:routes

  root :to => "blogs#index"

  map.resources :sessions, :users

  match 'login'  => 'sessions#new',     :as => :login
  match 'logout' => 'sessions#destroy', :as => :logout
  match 'join'   => 'users#new',        :as => :join

# START:routes

end
# END:routes
