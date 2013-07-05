class CreateEmployeesMealPlansJoin < ActiveRecord::Migration
  def up
    create_table 'employees_meal_plans', :id => false do |t|
      t.column 'employee_id', :integer
      t.column 'meal_plan_id', :integer
    end
  end

  def down
  end
end
