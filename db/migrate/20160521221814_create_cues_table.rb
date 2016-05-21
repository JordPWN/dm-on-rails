class CreateCuesTable < ActiveRecord::Migration
  def change
  	create_table :cues do |t|
  		t.text :content
  		t.references :beat
  	end
  end
end
