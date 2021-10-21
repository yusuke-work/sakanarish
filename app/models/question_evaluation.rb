# == Schema Information
#
# Table name: question_evaluations
#
#  id                   :bigint           not null, primary key
#  evaluation           :integer          not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  nutrient_category_id :bigint           not null
#  question_id          :bigint           not null
#  user_id              :bigint           not null
#
# Indexes
#
#  index_question_evaluations_on_nutrient_category_id  (nutrient_category_id)
#  index_question_evaluations_on_question_id           (question_id)
#  index_question_evaluations_on_user_id               (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (nutrient_category_id => nutrient_categories.id)
#  fk_rails_...  (question_id => questions.id)
#  fk_rails_...  (user_id => users.id)
#
class QuestionEvaluation < ApplicationRecord
  validates :evaluation, presence: true

  belongs_to :question
  belongs_to :nutrient_category
  belongs_to :user
end
