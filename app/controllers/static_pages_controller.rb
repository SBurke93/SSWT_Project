class StaticPagesController < ApplicationController
    
  def home
      @categories = Category.all
      @items = Item.all
     
  end
  
  def category
      catName = params[:title]
      @items = Item.where("category like ?", catName)
  end
  
  def help
  end
  
  def contact
    @items = Item.all
  end
  
  def validate
  end
  
  def paid
      @order = Order.find_by(id: params[:id])
      @order.update_attribute(:status, "Paid by User: #{current_user.email}")
  end
  
end
