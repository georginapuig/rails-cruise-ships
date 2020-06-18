class Ship < ApplicationRecord
  belongs_to :user
  validates :name, :location, :capacity, :description, :destination, presence: true
  validates :name, uniqueness: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  has_one_attached :photo
end
