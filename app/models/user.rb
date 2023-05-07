class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :likes, dependent: :destroy
  has_many :musics, through: :likes
  has_many :comments, dependent: :destroy

  validates :name, length: {maximum: 30}, if: -> {new_record? || changes[:crypted_password] }
  validates :password, length: {minimum: 3}, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, presence: true

  enum role: { general: 0, admin: 1 }

  def unlikes_music(music)
    likes.destroy(music)
  end

  def liked_by?(music)
    likes.exists?(music)
  end
end
