class Rental < ApplicationRecord
  belongs_to :user_id
  belongs_to :ski_id
end
