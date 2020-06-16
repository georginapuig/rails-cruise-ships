class Ship < ApplicationRecord
  belongs_to :users
  validates :name, :location, :capacity, :description, :destination, presence: true
  validates :name, uniqueness: true
end
