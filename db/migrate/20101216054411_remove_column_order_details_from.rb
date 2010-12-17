class RemoveColumnOrderDetailsFrom < ActiveRecord::Migration
  def self.up
    remove_column(:orders, :orders_details)
  end

  def self.down
    add_column :orders, :orders_details, :string
  end
end
