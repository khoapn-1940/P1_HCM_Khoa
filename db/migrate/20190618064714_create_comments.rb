class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :content
      t.references :user, index: true, foreign_key: { to_table: :users }
      t.references :review, index: true, foreign_key: { to_table: :reviews }
      t.references :reply, index: true, foreign_key: { to_table: :comments }
      t.timestamps
    end
  end
end
