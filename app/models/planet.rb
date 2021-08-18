class Planet < ApplicationRecord
  has_many :bookings
  belongs_to :user
  validates :name, :rotation_period, :diameter, :climate, :gravity, :terrain, :surface_water, :population, :price, presence: true
end
