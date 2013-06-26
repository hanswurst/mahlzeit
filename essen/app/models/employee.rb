class Employee < ActiveRecord::Base

  after_initialize :init

  def init
    self.default_number_of_meals_adults  ||= 1
    self.number_of_children_level_1 ||= 0
    self.number_of_children_level_2 ||= 0
    self.number_of_children_level_3 ||= 0
  end  

  attr_accessible :id, :firstname, :lastname, :getsMeals, :valid_to, :guest, :number_of_children_level_1, :number_of_children_level_2, :number_of_children_level_3, :default_number_of_meals_adults
  validates :id, :presence => true, :uniqueness => true	
  validates :firstname, :presence => true, :length => { :maximum => 40 }
  validates :lastname, :presence => true, :length => { :maximum => 40 }
  validates :number_of_children_level_1, :allow_blank => true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :number_of_children_level_2, :allow_blank => true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :number_of_children_level_3, :allow_blank => true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :default_number_of_meals_adults, :allow_blank => true, :numericality => { :greater_than_or_equal_to => 0 }
end
