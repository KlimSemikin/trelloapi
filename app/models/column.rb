class Column < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { maximum: 512 }

  has_many :cards
end
