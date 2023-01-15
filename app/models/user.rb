class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :musics, through: :likes_music
  has_many :likes_musics, dependent: :destroy

  validates :name, length: {maximum: 30}, if: -> {new_record? || changes[:crypted_password] }
  validates :password, length: {minimum: 3}, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :crypted_password, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, presence: true

  def unlikes_music(music)
    likes_musics.destroy(music)
  end

  def liked_by?(music)
    likes_musics.exists?(music)
  end
end
