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
require 'rails_helper'

RSpec.describe Fish, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
