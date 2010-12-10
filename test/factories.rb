require "faker"
Factory.define :item do |f|
	f.name Faker::Name.name
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