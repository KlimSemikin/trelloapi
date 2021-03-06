class Card < ApplicationRecord
  belongs_to :column
  belongs_to :user
  validates :title, presence: true

  has_many :comments, dependent: :destroy
end
