class CreateTourDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :tour_details do |t|
      t.float :price
      t.integer :tour_total
      t.datetime :time_start
      t.datetime :time_end
      t.references :user, index: true, foreign_key: { to_table: :users }
      t.references :tour, index: true, foreign_key: { to_table: :tours }
      t.timestamps
    end
  end
end
