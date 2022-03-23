class Ski < ApplicationRecord
  belongs_to :user
  validates :brand, :description, :price, :sizing, presence: true
  validates :category, presence: true
end

# message: "%{value} is not a valid category"

# validates :category, presence: true, inclusion: { in: %w[Ski\ Alpin Ski\ de\ Rando Ski\ de\ Fond Snowboard]}
