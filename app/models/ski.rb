class Ski < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates :brand, presence: true, inclusion: { in: %w[Rossignol Salomon Atomic K2 Volkl Dynastar Smith Marker Scott Black\ Crows Oakley Faction Bjorn Daehlie Cairn Armada Bolle Swix Blizzard Head Vola Zag Dynafit]}
  validates :title, :description, :price, presence: true
  validates :category, presence: true, inclusion: { in: %w[Ski\ Alpin Ski\ de\ Rando]}

  include PgSearch::Model
  pg_search_scope :search_by_brand_and_description,
    against: [ :brand, :description ],
    using: {
      tsearch: { prefix: true }
    }
end
