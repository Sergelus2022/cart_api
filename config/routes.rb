Rails.application.routes.draw do
  #root "carts#index"
  resources :carts do
    resources :sellitems
  end
   
  post 'cart/create', to: "carts#create"
  post 'cart/add', to: "carts#add"
  get 'cart/show'
  delete 'cart/delete', to: "carts#delete"
  delete 'cart/drop', to: "carts#drop"
  # get 'carts/new'
  # get 'carts/delete'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  
end
