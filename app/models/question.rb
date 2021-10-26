# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  text       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Question < ApplicationRecord
  has_many :question_evaluations
  
  validates :text, presence: true
end
