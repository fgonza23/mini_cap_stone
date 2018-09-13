json.id product.id
json.name product.name
json.price product.price
json.tax product.tax
json.total product.total
json.image_url product.image_url
json.description product.description
json.discounted product.is_discounted?

json.images do
  json.array! products, partial: 'api/images/image', as: :image

json.formatted do
  json.price number_to_currency(product.price)
  json.tax number_to_currency(product.tax)
  json.total number_to_currency(product.total)
end

json.current_user

json.supplier do
  json.partial! product.supplier, partial: 'api/suppliers/supplier', as: :supplier
end
