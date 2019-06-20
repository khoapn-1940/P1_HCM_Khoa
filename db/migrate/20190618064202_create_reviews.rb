class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :content
      t.boolean :enable
      t.references :user, index: true, foreign_key: { to_table: :users }
      t.references :tour, index: true, foreign_key: { to_table: :tours }

      t.timestamps
    end
  end
end
