class Music < ApplicationRecord
  has_many :music_categories
  has_many :categories, through: :music_category
  has_many :users, through: :like
  has_many :likes
  belongs_to :composer
end
