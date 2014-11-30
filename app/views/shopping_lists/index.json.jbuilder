json.array!(@shopping_lists) do |shopping_list|
  json.extract! shopping_list, :id, :name
  json.url shopping_list_url(shopping_list, format: :json)
end
