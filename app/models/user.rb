class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true
  validates :address, presence: true
  has_many :skis

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
