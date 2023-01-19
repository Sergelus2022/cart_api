Rails.application.routes.draw do
  #root "carts#index"
  resources :carts
  post 'carts/create', to: "carts#create"
  get 'carts/show'
  delete 'carts/delete', to: "carts#delete"
  # get 'carts/new'
  # get 'carts/delete'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  
end
