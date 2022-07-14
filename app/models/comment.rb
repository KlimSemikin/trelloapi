class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :card
  validates :content, length: { minimum: 1 }, allow_nil: false
end
