class Planet < ApplicationRecord
  belongs_to :user
  validates :name, :rotation_period, :diameter, :climate, :gravity, :terrain, :surface_water, :population, :price, :vehicles, presence: true
end
