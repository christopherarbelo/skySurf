class Aircraft < ApplicationRecord
  # validations
  validates :brand, :model, :capacity, presence: true

  # associations
  has_many :flights
end
