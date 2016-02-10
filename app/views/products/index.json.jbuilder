json.array!(@products,@categories) do |product,cat|
  json.extract! product, :id, :name, :price, :quantity, :purchasedate, :cat.name
  json.url product_url(product, format: :json)
end
