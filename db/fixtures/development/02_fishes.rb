require 'csv'

csv = CSV.read('db/csv/fishes.csv', headers: true)
csv.each do |fish|
  Fish.seed do |s|
    s.id = fish[0]
    s.name = fish[1]
    s.image_url = fish[2]
    s.rakuten_category_id = fish[3]
  end
end
