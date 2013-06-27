class Food < ActiveRecord::Base
  belongs_to :employee
  attr_accessible :date, :number_of_breakfasts, :number_of_lunches, :number_of_suppers
end
