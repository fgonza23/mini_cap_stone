class Api::ProductsController < ApplicationController

  def index
    @products = Product.all
    render 'index.json.jbuilder'

  end 

  def show 
    @product = Product.find(params[:id])
    render 'show.json.jbuilder'
  end 

  def create
    @product = Product.new(
                            name: params[:name],
                            price: params[:price],
                            image_url: params[:img_url],
                            description: params[:description]                            
                            )
    @product .save
    render 'show.json.jbuilder'
  end

  def update
    @product = Product.find(params[:id])

    @product.name = params[:id] || @product.name
    @product.price = params[:id] || @product.price
    @product.image_url = params[:id] || @product.image_url
    @product.description = params[:id] || @product.description

    @product.save
    render "show.json.jbuilder"
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    render json: {message: "Product successfully destroyed"}
  end
end


