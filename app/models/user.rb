# == Schema Information
#
# Table name: users
#
#  id               :bigint           not null, primary key
#  crypted_password :string(255)
#  email            :string(255)      not null
#  name             :string(255)      not null
#  role             :integer          default("general"), not null
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

  has_many :question_evaluations, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # お気に入りしたレシピを取得
  has_many :recipes, through: :favorites

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :name, presence: true
  validates :email, presence:true, uniqueness: true

  enum role: { general: 0, guest: 10, admin: 20 }

  def self.guest
    # ランダム数値作成
    random_value = SecureRandom.alphanumeric
    # ゲストユーザー作成(roleでgestを判断する)
    create!(name: 'guest_user', email: "#{random_value}@.com", password: random_value, password_confirmation: random_value, role: 10)
  end

  # ユーザーがお気に入り登録しているか判断
  def favorite?(obj)
    recipes.include?(obj)
  end

end
