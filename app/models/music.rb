class Music < ApplicationRecord
  has_many :music_categories
  has_many :categories, through: :music_categories
  has_many :likes
  has_many :users, through: :likes
  belongs_to :composer
end
