@recipes.each do |r|
  r.update_attribute(:name, r.name.capitalize())
end

@ingredients.each do |i|
  i.update_attribute(:name, i.name.capitalize())
end

Ingredient.select(:shop_section).distinct
x.each do |i|
  y = Ingredient.where(shop_section: i.shop_section)
  y.each do |ing|
    puts ing.name
  end
end