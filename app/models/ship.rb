class Ship < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_location_and_destination,
    against: [ :location, :destination ],
    using: {
      tsearch: { prefix: true }
    }
  belongs_to :user
  validates :name, :location, :capacity, :description, :destination, presence: true
  validates :name, uniqueness: true
  has_one_attached :photo
end
