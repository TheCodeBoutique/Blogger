Blogger::Application.routes.draw do


   get "admin/index"

    root :to => "users#index"

    controller :sessions do
      get  'login' => :new
      post 'login' => :create
      delete 'logout' => :destroy
    end

    resources :users do
      resources :posts
    end

  end

