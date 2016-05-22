class AddRatingsToGames < ActiveRecord::Migration
  def change
    add_column :games, :rating, :integer
  end
end
