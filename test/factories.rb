require "faker"
require "factory_girl"


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
  u.total_price "22"
end


Factory.define :item_order  do |u|
    u.association :order
    u.item_id      Factory.create(:item).id
end

#Factory.define(:item_order, :parent => :order) do |u|
#  u.after_build do |o|
#    o.items = [Factory.build(:item, :order => o), Factory.build(:item1, :order => o)]
#  end
#end

#Factory.define(:item_with_order, :parent => :order) do |i|
#  i.association(:order)
#end

# Run
#user = Factory(:user_with_items)
#user.items(true) # Shows the two saved items


