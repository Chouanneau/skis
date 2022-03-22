Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get    "skis",                          to: "skis#index"
  # post   "skis",                          to: "skis#create"
  # get    "skis/new",                      to: "skis#new"
  # get    "skis/:id/edit",                 to: "skis#edit"
  # get    "skis/:id",                      to: "skis#show", as: :ski
  # patch  "skis/:id",                      to: "skis#update"
  # delete "skis/:id",                      to: "skis#destroy"
  resources :skis

end
