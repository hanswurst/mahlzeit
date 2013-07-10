class MealPlanEntry < ActiveRecord::Base
  belongs_to :meal_plan
  belongs_to :employee

  attr_accessible :description,  :date, :number_of_breakfasts, :number_of_lunches, :number_of_suppers
end
