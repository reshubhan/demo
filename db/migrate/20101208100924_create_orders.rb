class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.string :orders_details
      t.integer :total_price

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
