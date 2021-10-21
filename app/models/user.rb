# == Schema Information
#
# Table name: users
#
#  id               :bigint           not null, primary key
#  crypted_password :string(255)
#  email            :string(255)      not null
#  first_name       :string(255)      not null
#  last_name        :string(255)      not null
#  salt             :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :email, presence:true, uniqueness: true

  has_many :question_evaluations

  def self.guest
    random_value = SecureRandom.alphanumeric
    create!(last_name: 'guest', first_name: 'user', email: "#{random_value}@.com", password: random_value, password_confirmation: random_value)
  end
end
