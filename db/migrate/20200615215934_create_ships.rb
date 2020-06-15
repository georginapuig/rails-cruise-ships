class CreateShips < ActiveRecord::Migration[6.0]
  def change
    create_table :ships do |t|
      t.string :name
      t.integer :capacity
      t.text :description
      t.string :destination
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
