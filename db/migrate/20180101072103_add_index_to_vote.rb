class AddIndexToVote < ActiveRecord::Migration
  def change
    add_index :votes, [:question_id, :user_id]
  end
end
