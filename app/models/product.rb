
class Product < ApplicationRecord
 validates :name, presence: true
 validates :name, uniqueness: true
 validates :description, presence: true
 validates :description, length: { minimum: 20 }
 validates :description, length: { maximum: 200 }
 validates :price, presence: true
 validates :price, numericality: { greater_than: 0 }
 validates :image_url, uniqueness: true

  belongs_to :supplier
  has_many :images
  has_many :orders


  def is_discounted? 
    price < 10 
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

end

