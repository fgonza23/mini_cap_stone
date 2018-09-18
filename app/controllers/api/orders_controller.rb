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
    carted_products = current_user.carted_products.where(status: "Carted")
    @order = Order.new(
                        user_id: current_user.id,
                        # product_id: params[:product_id],
                        # quantity: params[:quantity]
                      )

    @order.build_total
    @order.save

    render 'show.json.jbuilder'
  end
end
