class CreateMealPlans < ActiveRecord::Migration
  def change
    create_table :meal_plans do |t|
      t.date :valid_from
      t.date :valid_to

      t.timestamps
    end
  end
end
