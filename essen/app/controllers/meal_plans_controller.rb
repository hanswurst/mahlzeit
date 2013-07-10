class MealPlansController < ApplicationController

  def index
    @meal_plans = MealPlan.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def index_delete
    @meal_plans = MealPlan.all
    @date = DateTime.now.to_date

    respond_to do |format|
      format.html # index_delete.html.erb
    end
  end

  def new
    @meal_plan = MealPlan.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    @meal_plan = MealPlan.new(params[:meal_plan])

    respond_to do |format|
      if @meal_plan.save
        create_meal_plan_entries

        format.html { redirect_to @meal_plan, notice: I18n.t('meal_plan.success.new') }
        format.json { render json: @meal_plan, status: :created, location: @meal_plan }
      else
        format.html { render action: "new" }
        format.json { render json: @meal_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @meal_plan = MealPlan.find(params[:id])	
    meal_plan_entries = @meal_plan.meal_plan_entries_in_date_range
    @employees = Employee.find(meal_plan_entries.map(&:employee_id))
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @employee }
    end
  end

  def destroy
    @meal_plan = MealPlan.find(params[:id])
    @meal_plan.destroy

    respond_to do |format|
      format.html {redirect_to meal_plans_url}
    end
  end

  private

  def create_meal_plan_entries
    @employees = Employee.all.select(&:getsMeals?)
    @employees.each do |employee|
      (@meal_plan.valid_from).upto(@meal_plan.valid_to) { |date|
        meal_plan_entry = MealPlanEntry.new
        meal_plan_entry.number_of_breakfasts = number_of_breakfasts(employee)
        meal_plan_entry.number_of_lunches = employee.default_number_of_meals_adults
        meal_plan_entry.number_of_suppers = number_of_suppers(employee)
        meal_plan_entry.date = date
        meal_plan_entry.employee = employee
        meal_plan_entry.meal_plan = @meal_plan
        meal_plan_entry.save
      }
    end  
  end

  def number_of_breakfasts(employee)
    if employee.breakfast 
      employee.default_number_of_meals_adults
    else 0
    end
  end

  def number_of_suppers(employee)
    if employee.supper 
      employee.default_number_of_meals_adultss
    else 0
    end
  end
end
