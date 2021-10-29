# == Schema Information
#
# Table name: fish_nutrients
#
#  id                   :bigint           not null, primary key
#  evaluation           :integer          not null
#  nutritional_value    :float(24)        not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  fish_id              :bigint           not null
#  nutrient_category_id :bigint           not null
#
# Indexes
#
#  index_fish_nutrients_on_fish_id               (fish_id)
#  index_fish_nutrients_on_nutrient_category_id  (nutrient_category_id)
#
# Foreign Keys
#
#  fk_rails_...  (fish_id => fish.id)
#  fk_rails_...  (nutrient_category_id => nutrient_categories.id)
#
FactoryBot.define do
  factory :fish_nutrient do
    nutritional_value { 1 }
    fish { nil }
    nutrient_category { nil }
  end
end
