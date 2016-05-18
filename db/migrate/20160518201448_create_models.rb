class CreateModels < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :username
  		t.string :email
  		t.string :password
  		t.timestamps
  	end

  	create_table :campaigns do |t|
  		t.string :title
  		t.references :user
  		t.timestamps
  	end

  	create_table :games do |t|
  		t.references :user
  		t.references :campaign
  		t.references :beat
  		t.timestamps
  	end

  	create_table :beats do |t|
  		t.references :campaign
  		t.references :user
  		t.text :content
  		t.integer :order
  		t.timestamps
  	end
  end
end
