class MealPlan < ActiveRecord::Base

  has_and_belongs_to_many :employees

  attr_accessible :valid_from, :valid_to

  validates :valid_from, :presence => true, :date => {:after => Proc.new {Time.now}} 
  validates :valid_to, :presence => true, :date => {:after => Proc.new {Time.now}}
end
