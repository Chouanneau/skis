class Ski < ApplicationRecord
  belongs_to :user
  validates :brand, :description, :price, :sizing, presence: true
  validates :category, presence: true, inclusion: { in: %w[Ski\ Alpin Ski\ de\ Rando Ski\ de\ Fond Snowboard]}

  include PgSearch::Model
  pg_search_scope :search_by_brand_and_description,
    against: [ :brand, :description ],
    using: {
      tsearch: { prefix: true }
    }

end
