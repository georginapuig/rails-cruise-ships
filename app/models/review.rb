class Review < ApplicationRecord
  belongs_to :ship
  validates :content, length: { minimum: 1, maximum: 160 }
end
