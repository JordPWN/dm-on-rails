class AddOriginToCampaign < ActiveRecord::Migration
  def change
  	add_column :campaigns, :origin, :string
  end
end
