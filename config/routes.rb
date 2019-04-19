Rails.application.routes.draw do
 
  resources :categories
  
  get 'orderitems/index'
  get 'orderitems/show'
  get 'orderitems/new'
  get 'orderitems/edit'
  
  
  
  
  
  resources :orders do 
      resources:orderitems
     end
  
  
  
  devise_for :users do 
      resources:orders
  end
  
  
  
  
  get '/checkout' => 'cart#createOrder'
  
  
  
  
  
  post '/search' => 'items#search'
  
  
  
  get '/validate' => 'static_pages#form_validation'
  
  
 get 'cart/index'
  
 resources :items
 root 'static_pages#home'
 
 get '/contact' =>'static_pages#contact'
 get '/help' => 'static_pages#help'
 
 get '/login' => 'user#login' 
 get '/logout' => 'user#logout' 
 
 get '/cart/clear' => 'cart#clearCart'
 
 get '/cart/:id', to: 'cart#add' # the , to: is the same as th =>
 
 get '/cart/remove/:id' => 'cart#remove'
 
 get '/paid/:id' => 'static_pages#paid'
 
 get '/category/:title' => 'static_pages#category'
 
 get '/cart/decrease/:id' => 'cart#decrease'
 
 
 
 get '/showuser' => 'static_pages#allusers'
 get '/upgrade/:id' => 'static_pages#upgrade'
 get '/downgrade/:id' => 'static_pages#downgrade'
 
 
 
 get '/cart' => 'cart#index'
 # get 'static_pages/home'
 # get 'static_pages/help'
 # get 'static_pages/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
