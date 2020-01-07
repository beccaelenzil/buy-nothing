Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "homepages#root"

  resources :groups, shallow: true do
    resources :items
    resources :members, shallow: true do 
      resources :items
    end
  end

end
