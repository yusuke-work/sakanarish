require 'csv'

csv = CSV.read('db/csv/fish_nutrients.csv', headers: true)
csv.each do |fish_nutrient|
  FishNutrient.seed do |s|
    s.fish_id = fish_nutrient[1]
    s.nutrient_category_id = fish_nutrient[2]
    s.nutritional_value = fish_nutrient[3]
  end
end
