# == Schema Information
#
# Table name: fish
#
#  id                  :bigint           not null, primary key
#  name                :string(255)      not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  rakuten_category_id :string(255)      not null
#
FactoryBot.define do
  factory :fish do
    name { "MyString" }
    rakuten_category_id { 1 }
  end
end
