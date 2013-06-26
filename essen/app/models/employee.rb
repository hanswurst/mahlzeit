class Employee < ActiveRecord::Base
  attr_accessible :id, :firstname, :lastname, :getsMeals, :valid_to
  validates :id, :presence => true, :uniqueness => true	
  validates :firstname, :presence => true, :length => { :maximum => 40 }
  validates :lastname, :presence => true, :length => { :maximum => 40 }
end
