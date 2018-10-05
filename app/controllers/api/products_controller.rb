dclass Api::ProductsController < ApplicationController
  # before_action :authenticate_admin, only: [:index, :show]
  



  def index
    search_term = params[:search]
    sort_attribute = params[:sort]
    sort_order = params[:sort_order]

    @products = Product.all

    category_name = params[:category]
    if category_name
      category = Category.find_by(name: category_name)
      @products = category.products
    end

    search_term = params[:search]

    if search_term
      @products = @products.where(
                                "name iLike ?",
                                "%#{search_term}"
                                )
    end

    sort_by = params[:sort]
    sort_order = params[:sort_order]

    if sort_by && sort_order
      @products = @products.order(sort_by => sort_order)

    elsif sort_by
      @products = @products.order(sort_by)

    end    
                                
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
                            # image_url: params[:img_url],                            
                            description: params[:description],
                            supplier_id: params[:supplier_id]                            
                            )
     if @product .save
      render 'show.json.jbuilder'
     else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
     end
  end

  def update
    @product = Product.find(params[:id])

    @product.name = params[:id] || @product.name
    @product.price = params[:id] || @product.price
    @product.image_url = params[:id] || @product.image_url
    @product.description = params[:id] || @product.description

   if @product.save
    render "show.json.jbuilder"
   else
    render json: {errors: @product.errors.full_messages }, status: :unprocessable_entity
   end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    render json: {message: "Product successfully destroyed"}
  end
end


