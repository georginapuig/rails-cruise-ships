class RemoveUsersFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_reference :bookings, :users, index: true, foreign_key: true
    remove_reference :bookings, :ships, index: true, foreign_key: true
    add_reference :bookings, :user, index: true, foreign_key: true
    add_reference :bookings, :ship, index: true, foreign_key: true
    add_column :ships, :price, :integer
  end
end
