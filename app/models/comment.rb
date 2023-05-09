class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :music

  validates :body, presence: true
end
