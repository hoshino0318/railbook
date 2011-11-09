class Book < ActiveRecord::Base
  validates :isbn,
  :length => { :is => 17 },
  :presence => true,
  :uniqueness => true
end
