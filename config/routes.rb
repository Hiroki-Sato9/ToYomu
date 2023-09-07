Rails.application.routes.draw do
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users do
    resources :goals
  end
  get "/signup", to: "users#new"

  resources :books

end
