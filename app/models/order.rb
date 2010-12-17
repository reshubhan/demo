class Order < ActiveRecord::Base
  has_many :item_orders
end
