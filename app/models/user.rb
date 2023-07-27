class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :likes, dependent: :destroy
  has_many :musics, through: :likes
  has_many :comments, dependent: :destroy

  validates :name, presence: true, length: { maximum: 30 }, if: -> {new_record? || changes[:crypted_password] }
  validates :email, presence: true, 
                    uniqueness: true, 
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, 
                      length: { minimum: 8 }, 
                      confirmation: true, 
                      format: { with: /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,12}\z/ }, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  enum role: { general: 0, admin: 1 } 

  def unlikes_music(music)
    likes.destroy(music)
  end

  def liked_by?(music)
    likes.exists?(music)
  end

  def own?(object)
    id == object.user_id
  end
end
