# == Schema Information
#
# Table name: fish
#
#  id                  :bigint           not null, primary key
#  image_url           :string(255)      not null
#  name                :string(255)      not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  rakuten_category_id :integer          not null
#
FactoryBot.define do
  factory :fish do
    name { "MyString" }
    image_url { "MyString" }
    rakuten_category_id { 1 }
  end
end
