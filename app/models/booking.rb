class Booking < ApplicationRecord
  # associations
  belongs_to :flight
  has_many :passengers, dependent: :destroy

  # nested attributes
  accepts_nested_attributes_for :passengers
  
  # validations
  validates :passengers, presence: true
  validates :email, presence: true
end
