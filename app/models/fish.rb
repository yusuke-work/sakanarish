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
class Fish < ApplicationRecord
  has_many :fish_nutrients

  validates :image_url, presence: true
  validates :name, presence: true
  validates :rakuten_category_id, presence: true
end
