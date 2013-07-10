class MealPlanEntriesController < ApplicationController
  def edit
    @meal_plan_entry = MealPlanEntry.find(params[:id])
    @employee = Employee.find(@meal_plan_entry.employee)
    @referer = request.referer
  end

  def update
    @meal_plan_entry = MealPlanEntry.find(params[:id])

    respond_to do |format|
      if @meal_plan_entry.update.attrobutes(params[:food])
        #format.html {redirecti}
      else
        format.html { render action: ":edit" }
      end
    end
  end

end
