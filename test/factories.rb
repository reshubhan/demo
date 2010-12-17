require "faker"
Factory.define :item do |f|
	f.name "Apple"
  f.price "22"
end

Factory.define :item1, :parent => :item do |t|
  t.name "Guava"
  t.price "33"
end

Factory.define :item3 do |t|
  t.name "banana"
  t.price "36"
end


Factory.define :category do |f|
  f.name "amar"
end

Factory.define(:order) do |u|
  u.total_price 29
end


Factory.define(:orders_with_items, :parent => :order) do |u|
  u.after_create do |o|
    o.items = [Factory.build(:item, :order => o), Factory.build(:item, :order => o)]
  end
end

Factory.define(:item) do |i|
  i.name "red1"
  i.price "29"
end

Factory.define(:item_with_order, :parent => :order) do |i|
  i.association(:order)
end

