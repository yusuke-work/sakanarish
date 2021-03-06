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
class Recipe < ApplicationRecord
  belongs_to :fish
  has_many :favorites, dependent: :destroy

  validates :image_url, presence: true
  validates :indication, presence: true
  validates :material, presence: true
  validates :title, presence: true
  validates :url, presence: true
  validates :original_recipe_id, uniqueness: true
end
