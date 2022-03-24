class Ski < ApplicationRecord
  belongs_to :user
  has_many :rentals, dependent: :destroy
  validates :brand, :description, :price, :category, :sizing, presence: true
end
