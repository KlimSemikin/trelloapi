class User < ApplicationRecord
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :validatable
  include DeviseTokenAuth::Concerns::User

  validates :email, length: { maximum: 100 }

  has_many :columns, dependent: :destroy
  has_many :cards, dependent: :destroy
  has_many :comments, dependent: :destroy
end
