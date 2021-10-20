require 'csv'

csv = CSV.read('db/csv/fishes.csv')
csv.each do |fish|
  Fish.seed do |s|
    s.name = fish[0]
    s.rakuten_category_id = fish[1]
  end
end
