class Planet < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user
  validates :name, :rotation_period, :diameter, :climate, :gravity, :terrain, :surface_water, :population, :price, presence: true
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_name_and_terrain,
    against: [ :name, :terrain ],
    using: {
      tsearch: { prefix: true }
    }
end
