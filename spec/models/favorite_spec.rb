# == Schema Information
#
# Table name: favorites
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  recipe_id  :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_favorites_on_recipe_id              (recipe_id)
#  index_favorites_on_user_id                (user_id)
#  index_favorites_on_user_id_and_recipe_id  (user_id,recipe_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (recipe_id => recipes.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Favorite, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
