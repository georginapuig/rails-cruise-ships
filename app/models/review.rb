class Review < ApplicationRecord
  belongs_to :ship
  validates :content, length: { minimum: 20, maximum: 160 }
end
