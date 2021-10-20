require 'csv'

csv = CSV.read('db/csv/fishes.csv', headers: true)
csv.each do |fish|
  Fish.seed do |s|
    s.id = fish[0]
    s.name = fish[1]
    s.rakuten_category_id = fish[2]
  end
end
