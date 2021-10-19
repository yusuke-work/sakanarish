# == Schema Information
#
# Table name: nutrient_categories
#
#  id         :bigint           not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :nutrient_category do
    name { "MyString" }
  end
end
