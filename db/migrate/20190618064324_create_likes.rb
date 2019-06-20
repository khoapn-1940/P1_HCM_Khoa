class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :user, index: true, foreign_key: { to_table: :users }
      t.references :review, index: true, foreign_key: { to_table: :reviews }
      t.timestamps
    end
  end
end
