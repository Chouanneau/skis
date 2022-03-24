class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :ski
end
