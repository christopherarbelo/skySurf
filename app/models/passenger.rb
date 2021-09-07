class Passenger < ApplicationRecord
  # validations
  validates :name, presence: true
  
  # associations
  belongs_to :booking
end
