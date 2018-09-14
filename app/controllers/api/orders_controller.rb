class Api::OrdersController < ApplicationController
  before_action :authenticate_user, only: [:index, :create]

  def index
    if current_user
      @orders = current_user.orders
      render 'index.json.jbuilder'
    else
      render json: [], status: :unathorized

  end

  def create
    @order = Order.new(
                        user_id: current_user.id,
                        product_id: params[:product_id],
                        quantity: params[:quantity]
                      )

    @order.build_total
    @order.save

    render 'show.json.jbuilder'
  end
 end
end
