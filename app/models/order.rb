class Order < ApplicationRecord


  belongs_to :user
  

  has_many :carted_products
  has_many :products, through: :carted_products

  def calculate_subtotal(cart)
    
    subtotal = 0
    carted_products.each do |carted| 
      subtotal += carted.product.price * carted.quantity
    end
    

  end


end
