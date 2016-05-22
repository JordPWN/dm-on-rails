class CreateTableRatings < ActiveRecord::Migration
  def change
      create_table :ratings do |t|
      t.references :campaign
      t.references :user
      t.integer :rating
      t.timestamps
    end
  end
end
