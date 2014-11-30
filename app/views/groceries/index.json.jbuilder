json.array!(@groceries) do |grocery|
  json.extract! grocery, :id, :name, :section
  json.url grocery_url(grocery, format: :json)
end
