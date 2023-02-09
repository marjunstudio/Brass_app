class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :like_musics, through: :likes, source: :music
  has_many :likes, dependent: :destroy
  has_many :musics, dependent: :destroy

  validates :name, length: {maximum: 30}, if: -> {new_record? || changes[:crypted_password] }
  validates :password, length: {minimum: 3}, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :crypted_password, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, presence: true

  enum role: { general: 0, admin: 1 }

  def unlikes_music(music)
    likes.destroy(music)
  end

  def liked_by?(music)
    likes.exists?(music)
  end
end
