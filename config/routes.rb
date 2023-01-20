Rails.application.routes.draw do
  #root "carts#index"
  resources :carts
  post 'cart/create', to: "carts#create"
  get 'cart/show'
  delete 'cart/delete', to: "carts#delete"
  get ''
  # get 'carts/new'
  # get 'carts/delete'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  
end
