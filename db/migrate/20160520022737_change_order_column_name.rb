class ChangeOrderColumnName < ActiveRecord::Migration
  def change
		rename_column :beats, :order, :ordinance
  end
end
