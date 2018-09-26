class Api::OrdersController < ApplicationController
  before_action :authenticate_user, 

  def index
    if current_user
      @orders = current_user.orders
      render 'index.json.jbuilder'
    else
      render json: [], status: :unathorized
    end
  end

  def create
    if current_user
    carted_products = current_user.cart
    @order = Order.new(user_id: current_user.id)

    else  
      render json: [], status: :unathorized 
    end


    @order.calculate
    @order.tax = @order.subtotal * 0.09
    @order.total = @order.subtotal + @order.tax


   
    @order.save

    carted_products.update_all(status: 'purchased', order_id: @order_id)

    render 'show.json.jbuilder'
  end
end
