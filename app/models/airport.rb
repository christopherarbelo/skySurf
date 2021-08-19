class Airport < ApplicationRecord
  # validations
  validates :code, :name, :location, presence: true

  # associations
  has_many :flights, foreign_key: 'origin_id', inverse_of: 'origin'
end
