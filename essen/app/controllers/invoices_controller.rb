class InvoicesController < ApplicationController

  def new
    @invoice = Invoice.new
    
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    start_of_month_date = params["invoice"].map{|k,v| v}.join("-").to_date
    end_of_month_date = start_of_month_date.end_of_month
    @month = start_of_month_date.strftime("%B") 
    @meal_plan_entries_per_month = meal_plan_entries_for_month_per_employee(start_of_month_date, end_of_month_date)
  end

  private

  def meal_plan_entries_for_month_per_employee(start_date, end_date)
    MealPlanEntry.joins("JOIN employees ON employees.id = employee_id")
                 .where("date >= ? AND date <= ?", start_date, end_date)
                 .group(:employee_id, :age_type)
                 .order(:lastname, :firstname)
                 .select('employee_id, age_type, firstname, lastname, SUM(number_of_breakfasts) as sum_breakfasts, SUM(number_of_lunches) as sum_lunches, SUM(number_of_suppers) as sum_suppers')
  end

end
