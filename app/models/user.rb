class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :name, length: {maximum: 30}, if: -> {new_record? || changes[:crypted_password] }
  validates :password, length: {minimum: 3}, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :crypted_password, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, presence: true
end
