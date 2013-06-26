class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :id
      t.string :firstname
      t.string :lastname
      t.boolean :getsMeals

      t.timestamps
    end
  end
end
