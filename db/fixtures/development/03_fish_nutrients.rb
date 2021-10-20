require 'csv'

csv = CSV.read('db/csv/fish_nutrients.csv')
csv.each do |fish_nutrient|
  Fish.seed do |s|
    s.fish_id = fish_nutrient[0]
    s.nutrient_category_id = fish_nutrient[1]
    s.nutritional_value = fish_nutrient[2]
  end
end
