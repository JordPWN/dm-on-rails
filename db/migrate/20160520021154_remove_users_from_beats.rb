class RemoveUsersFromBeats < ActiveRecord::Migration
   def change
    remove_column :beats, :user_id, :integer
  end
end
