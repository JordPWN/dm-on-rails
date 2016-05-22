class ChangeOriginToInteger < ActiveRecord::Migration
  def change
    remove_column :campaigns, :origin, :string
    add_column :beats, :cue, :text
  end
end


