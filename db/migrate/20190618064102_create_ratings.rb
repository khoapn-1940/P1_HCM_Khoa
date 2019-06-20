class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.integer :star
      t.references :user, index: true, foreign_key: { to_table: :users }
      t.references :tour, index: true, foreign_key: { to_table: :tours }
      t.timestamps
    end
  end
end
