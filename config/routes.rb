Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "members#login_form"

  resources :groups, shallow: true do
    resources :items
  end
  resources :members, shallow: true do 
    resources :items
  end

  get "/member_groups", to: "groups#member_groups", as: "member_groups"

  get "/join", to: "relationships#join_form", as: "join"
  post "/join", to: "relationships#join"

  get "/login", to: "members#login_form", as: "login"
  get "/signup", to: "members#signup_form", as: "signup"
  post "/login", to: "members#login"
  post "/signup", to: "members#signup"
  post "/logout", to: "members#logout", as: "logout"
  
  get "/members/current", to: "members#current", as: "current_member"
end
