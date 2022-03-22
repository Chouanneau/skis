class Ski < ApplicationRecord
  belongs_to :user
  validates :brand, :description, :price, :category, :sizing, presence: true
end
