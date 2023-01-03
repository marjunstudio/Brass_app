class Music < ApplicationRecord
  has_many :music_categories
  has_many :categories, through: :music_category
end
