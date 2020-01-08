Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "homepages#root"

  resources :groups, shallow: true do
    resources :items
    resources :members, shallow: true do 
      resources :items
    end
  end

  get "/login", to: "members#login_form", as: "login"
  get "/signup", to: "members#signup_form", as: "signup"
  post "/login", to: "members#login"
  post "/signup", to: "members#signup"
  post "/logout", to: "members#logout", as: "logout"
  get "/members/current", to: "members#current", as: "current_member"
end
