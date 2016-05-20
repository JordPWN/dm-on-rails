class AddUrlToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :url, :text
  end
end
