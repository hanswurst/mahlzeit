class MealPlanEntry < ActiveRecord::Base
  belongs_to :meal_plan
  belongs_to :employee

  attr_accessible :description,  :date, :number_of_breakfasts, :number_of_lunches, :number_of_suppers, :age_type

  AGE_TYPES = %w{ adult, level_1, level_2, level_3}

  def adult?
    age_type == 0
  end

  def level_1?
    age_type == 1
  end

  def level_2?
    age_type == 2
  end

  def level_3?
    age_type == 3
  end

  def child_age_level_to_s
    return I18n.t('invoice.entry.children_level_1') if level_1?
    return I18n.t('invoice.entry.children_level_2') if level_2?
    return I18n.t('invoice.entry.children_level_3') if level_3?
  end

  def self.adult_age_type_index
    0 
  end

  def self.level_1_age_type_index
    1 
  end

  def self.level_2_age_type_index
    2
  end

  def self.level_3_age_type_index
    3
  end
end
