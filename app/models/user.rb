class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :ships
  has_many :bookings
  validates :first_name, :last_name, :email, :phone_number, :password, presence: true
  validates :email, :phone_number, uniqueness: true
end
