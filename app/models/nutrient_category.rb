# == Schema Information
#
# Table name: nutrient_categories
#
#  id         :bigint           not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class NutrientCategory < ApplicationRecord
  validates :name, presence: true

  has_many :question_evaluations
  has_many :fish_nutrients
end
