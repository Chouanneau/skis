class Ski < ApplicationRecord
  belongs_to :user
  validates :brand, presence: true, inclusion: { in: %w[Rossignol Salomon Atomic K2 Volkl Dynastar Smith Marker Scott Black\ Crows Oakley Faction Bjorn Daehlie Cairn Armada Bolle Swix Blizzard Head Vola Zag Dynafit]}
  validates :title, :description, :price, presence: true
  validates :category, presence: true, inclusion: { in: %w[Ski\ Alpin Ski\ de\ Rando]}
end

# message: "%{value} is not a valid category"

# validates :brand, :description, :price, :sizing, presence: true
