class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :status
      t.integer :book_total
      t.references :user, index: true, foreign_key: { to_table: :users }
      t.references :tour_detail, index: true, foreign_key: { to_table: :tour_details }
      t.timestamps
    end
  end
end
