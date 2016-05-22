class AddOriginToCampaignsToI < ActiveRecord::Migration
  def change
    add_column :campaigns, :origin, :integer
  end
end
