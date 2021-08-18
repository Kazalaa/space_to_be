class Planet < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, :rotation_period, :diameter, :climate, :gravity, :terrain, :surface_water, :population, :price, presence: true
end
