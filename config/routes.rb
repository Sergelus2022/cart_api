Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  get 'carts/index' , to: "carts#index"
  get 'cart/show', to: "carts#show"
  
  resources :carts do
    resources :sellitems
  end

  post 'cart/create', to: "carts#create"
  post 'cart/add', to: "carts#add"

  delete 'cart/delete', to: "carts#delete"
  delete 'cart/drop', to: "carts#drop"
  # get 'carts/delete'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  
end
