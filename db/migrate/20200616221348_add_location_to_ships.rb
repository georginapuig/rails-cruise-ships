class AddLocationToShips < ActiveRecord::Migration[6.0]
  def change
    add_column :ships, :location, :string
  end
end
