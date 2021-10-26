# == Schema Information
#
# Table name: recipes
#
#  id         :bigint           not null, primary key
#  image_url  :string(255)      not null
#  indication :string(255)      not null
#  material   :string(255)      not null
#  title      :string(255)      not null
#  url        :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  fish_id    :bigint           not null
#
# Indexes
#
#  index_recipes_on_fish_id  (fish_id)
#
# Foreign Keys
#
#  fk_rails_...  (fish_id => fish.id)
#
require 'rails_helper'

RSpec.describe Recipe, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
