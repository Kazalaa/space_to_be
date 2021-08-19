class Planet < ApplicationRecord
  has_many :bookings
  belongs_to :user
  has_many :bookings
  validates :name, :rotation_period, :diameter, :climate, :gravity, :terrain, :surface_water, :population, :price, presence: true
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_name_and_terrain,
    against: [ :name, :terrain ],
    using: {
      tsearch: { prefix: true }
    }
end
