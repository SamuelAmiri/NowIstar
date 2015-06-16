json.array!(@subcategories) do |subcategory|
  json.extract! subcategory, :id, :name, :category
  json.url subcategory_url(subcategory, format: :json)
end
