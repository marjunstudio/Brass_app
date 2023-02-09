class Category < ApplicationRecord
  has_many :music_categories
  has_many :musics, through: :music_categories
end
