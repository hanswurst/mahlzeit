class MealPlan < ActiveRecord::Base

  has_and_belongs_to_many :employees

  attr_accessible :valid_from, :valid_to

  validates :valid_from, :presence => true, :date => {:after => Proc.new {Time.now}} 
  validates :valid_to, :presence => true, :date => {:after => Proc.new {Time.now}}

  before_destroy :check_valid_from_date

  def check_valid_from_date
    errors.add(:base, "Plan kann nicht geloescht werden da Datum 'Gueltig ab' nicht in der Zukunft liegt") unless DateTime.now.to_date < valid_from
    errors.blank?
  end
end
