class CookingsController < ApplicationController

  def new
    @cooking = Cooking.new
    
    respond_to do |format|
      format.html # new.html.erb
    end 
  end

  def create
    @report_date = params[:report_date]
    @date = date_from_button_select
    @meal_plan_entries_per_day = meal_plan_entries_per_day
  end

  private

  def date_from_button_select
    return Date.today if @report_date == 'today'
    return Date.today + 1.day if @report_date == 'tomorrow'
  end

  def meal_plan_entries_per_day
    MealPlanEntry.where("date = ?", @date)
                 .group(:age_type)
                 .select('age_type, SUM(number_of_breakfasts) as sum_breakfasts, SUM(number_of_lunches) as sum_lunches, SUM(number_of_suppers) as sum_suppers')
  end
end
