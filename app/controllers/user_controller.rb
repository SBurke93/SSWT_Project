class UserController < ApplicationController
    
    
    
    def login
            session[:login] = 1
            session[:cart] = nil
            flash[:notice] = "You're a Wizard Harry!!!!"
            redirect_to :controller => :items
    end

    def logout
            session[:login] = nil
            session[:cart] = nil
            flash[:notice] = "Until next time."
            redirect_to :controller => :items
    end

    
    
    
end
