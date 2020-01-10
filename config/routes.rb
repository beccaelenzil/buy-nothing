Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "members#login_form"

  resources :groups, shallow: true do
    resources :members
    resources :items
  end
  resources :members, shallow: true do
    resources :groups
    resources :items
  end

  resources :relationships, only: [:index, :destroy]

  #delete "/relationships/:group_id", to: "relationship#destroy", as: "relationships"

  #join
  get "/join", to: "relationships#join_form", as: "join"
  post "/join", to: "relationships#join"
  post "/groups/:id/join", to: "groups#join", as: "join_group"

  #login
  get "/login", to: "members#login_form", as: "login"
  post "/login", to: "members#login"
  #signup
  get "/signup", to: "members#signup_form", as: "signup"
  post "/signup", to: "members#signup"
  #logout
  post "/logout", to: "members#logout", as: "logout"
  #current
  get "/users/current", to: "users#current", as: "current_user"
end
