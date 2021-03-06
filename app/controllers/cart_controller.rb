class CartController < ApplicationController
  ######### start of add to cart logic ######### 
  
  
  def add
    # we need the id of the product to be added
    # lets get it now
    
    id = params[:id]
    # if the cart exists already use it if not make a new one
    if session[:cart] then
      cart = session[:cart]
    else
      session[:cart] = {}
      cart = session[:cart]
    end
    
    # If the product is in the cart then increase the existing quantity by 1
     if cart[id] then
     cart[id] = cart[id] + 1 # this is the actual increase quantity part
    else
     cart[id] = 1
    end
    
  redirect_to :action => :index
  
  end 
  
  
  ######## Clear Cart ###############
  def clearCart
    # This sets the cart session to not exist
    session[:cart] = nil
    redirect_to :action => :index
  end  
  
  ### Start of remove from cart ########
  
  def remove
    id = params[:id]
    cart = session[:cart]
    cart.delete id
    
    redirect_to :action => :index
  end
  
  
  
  ############### Start of index logic ####################
  
  def index
    # this method will pass the content of the cart to the page view
    
    if session[:cart] then
      @cart = session[:cart] # if session exists the pass cart contents to the cart view
     else 
       @cart = {} # if the cart isnt a session the say the cart contents is empty
       
    end  
    
  end
  
  def decrease
    id = params[:id]
    cart = session[:cart]
    
    if cart[id] == 1 then
      cart.delete id
    else
    cart[id] = cart[id] - 1
    end
    redirect_to :action => :index
    
  end
  
  
end