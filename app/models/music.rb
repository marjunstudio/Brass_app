class Music < ApplicationRecord
  has_many :music_categories, dependent: :destroy
  has_many :categories, through: :music_categories
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
  has_many :comments, dependent: :destroy
  belongs_to :composer
end
