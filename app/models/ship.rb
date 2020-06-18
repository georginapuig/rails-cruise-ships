class Ship < ApplicationRecord
  belongs_to :user
  validates :name, :location, :capacity, :description, :destination, presence: true
  validates :name, uniqueness: true
  has_one_attached :photo
  has_one :booking, dependent: :destroy
end
