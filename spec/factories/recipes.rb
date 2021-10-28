# == Schema Information
#
# Table name: recipes
#
#  id                 :bigint           not null, primary key
#  image_url          :string(255)      not null
#  indication         :string(255)      not null
#  material           :string(255)      not null
#  title              :string(255)      not null
#  url                :string(255)      not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  fish_id            :bigint           not null
#  original_recipe_id :integer          not null
#
# Indexes
#
#  index_recipes_on_fish_id             (fish_id)
#  index_recipes_on_original_recipe_id  (original_recipe_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (fish_id => fish.id)
#
FactoryBot.define do
  factory :recipe do
    image_url { "MyString" }
    title { "MyString" }
    material { "MyString" }
    indication { "MyString" }
    url { "MyString" }
    fish { nil }
  end
end
