class MealPlan < ActiveRecord::Base

  has_and_belongs_to_many :employees

  attr_accessible :valid_from, :valid_to

  validates :valid_from, :presence => true, :date => {:after => Proc.new {Time.now}} 
  validates :valid_to, :presence => true, :date => {:after => Proc.new {Time.now}}
  validate :date_is_monday, :date_is_sunday, :check_date_overlapings, :check_date_range 

  before_destroy :check_valid_from_date

  def check_valid_from_date
    errors.add(:base, "Plan kann nicht geloescht werden da Datum 'Gueltig ab' nicht in der Zukunft liegt") unless DateTime.now.to_date < valid_from
    errors.blank?
  end

  private
  
  def date_is_monday
    errors.add(:valid_from, I18n.t('activerecord.errors.models.meal_plan.attributes.valid_from.not_monday')) unless valid_from.monday?	
  end

  def date_is_sunday
    errors.add(:valid_to, I18n.t('activerecord.errors.models.meal_plan.attributes.valid_to.not_sunday')) unless valid_to.sunday?
  end

  def check_date_overlapings
    @meal_plans = MealPlan.where('valid_from >= ? AND valid_from <= ? OR valid_to <= ? AND valid_to >= ?', valid_from, valid_to, valid_to, valid_from)
    if !@meal_plans.empty?
      errors.add(:base, I18n.t('activerecord.errors.models.meal_plan.attributes.base.date_range_violation'))
    end
  end

  def check_date_range
    if !(valid_to == valid_from + 6.days)
      errors.add(:valid_to, I18n.t('activerecord.errors.models.meal_plan.attributes.valid_to.only_one_week'))
    end
  end
end
