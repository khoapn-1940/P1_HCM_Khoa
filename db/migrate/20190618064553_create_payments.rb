class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :method
      t.string :content
      t.references :booking, index: true, foreign_key: { to_table: :bookings }

      t.timestamps
    end
  end
end
