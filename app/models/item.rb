class Item < ActiveRecord::Base
  #validate_presence_of(:name)
  #validates_length_of :name, :within => 6..20
   acts_as_commentable
end
