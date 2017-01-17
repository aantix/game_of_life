class CreateGenerations < ActiveRecord::Migration[5.0]
  def change
    create_table :generations do |t|
      t.integer :game_id
      t.integer :iteration, default: 1
      t.text :cells

      t.timestamps
    end
  end
end
