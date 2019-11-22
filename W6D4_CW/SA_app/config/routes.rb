Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, except: [:edit, :new] do
    resources :artworks, only: [:index]
  end

  resources :artworks, except: [:edit, :new, :index]
  resources :artworkshares, only: [:create, :destroy]
  
  

end


# MANUAL
# get "/users", to: "users#index"
# get "/users/:id", to: "users#show", as: "user"
# post "/users", to: "users#create"
# patch "/users/:id", to: "users#update"
# delete "/users/:id", to: "users#destroy"
# get "/users/new", to: "users#new"
# get "/users/:id/edit", to: "users#edit" 