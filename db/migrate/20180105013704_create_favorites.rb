class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :question_id

      t.timestamps null: false
    end
    add_index :favorites, :user_id
    add_index :favorites, :question_id
    add_index :favorites, [:user_id, :question_id], unique: true
  end
end
