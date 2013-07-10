class CreateMealPlanEntries < ActiveRecord::Migration
  def change
    create_table :meal_plan_entries do |t|
      t.string :id
      t.references :employee
      t.string :description
      t.date :date
      t.integer :number_of_breakfasts
      t.integer :number_of_lunches
      t.integer :number_of_suppers
      t.references :meal_plan

      t.timestamps
    end
    add_index :meal_plan_entries, :meal_plan_id 
    add_index :meal_plan_entries, :employee_id 

  end
end
