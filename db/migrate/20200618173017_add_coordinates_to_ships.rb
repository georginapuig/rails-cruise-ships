class AddCoordinatesToShips < ActiveRecord::Migration[6.0]
  def change
    add_column :ships, :latitude, :float
    add_column :ships, :longitude, :float
  end
end
