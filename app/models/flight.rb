class Flight < ApplicationRecord
  # validations
  validates :origin, :destination, presence: true
  
  # associations
  belongs_to :aircraft
  belongs_to :origin, class_name: 'Airport'
  belongs_to :destination, class_name: 'Airport'
end
