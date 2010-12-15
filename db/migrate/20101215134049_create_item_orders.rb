class CreateItemOrders < ActiveRecord::Migration
  def self.up
    create_table :item_orders do |t|
      t.integer :order_id
      t.integer :item_id

      t.timestamps
    end
  end

  def self.down
    drop_table :item_orders
  end
end
