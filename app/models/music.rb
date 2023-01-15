class Music < ApplicationRecord
  has_many :music_categories
  has_many :categories, through: :music_category
  has_many :users, through: :likes_music
  has_many :likes_musics
end
