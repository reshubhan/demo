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

Factory.define(:user) do |u|
  u.name "foo"
end

Factory.define(:user_with_items, :parent => :user) do |u|
  u.after_build do |o|
    o.items = [Factory.build(:item, :user => o), Factory.build(:item, :user => o)]
  end
end

Factory.define(:item) do |i|
  i.color "red"
end

Factory.define(:item_with_user, :parent => :user) do |i|
  i.association(:user)
end

# Run
#user = Factory(:user_with_items)
#user.items(true) # Shows the two saved items


