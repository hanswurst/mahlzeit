class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.datetime :date
      t.integer :number_of_breakfasts
      t.integer :number_of_lunches
      t.integer :number_of_suppers
      t.references :employee

      t.timestamps
    end
    add_index :foods, :employee_id
  end
end
