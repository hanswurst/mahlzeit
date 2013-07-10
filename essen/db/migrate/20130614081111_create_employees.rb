class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :id
      t.string :firstname
      t.string :lastname
      t.boolean :getsMeals
      t.boolean :guest
      t.integer :number_of_children_level_1
      t.integer :number_of_children_level_2
      t.integer :number_of_children_level_3
      t.integer :default_number_of_meals_adults
      t.date :valid_to
      t.boolean :breakfast
      t.boolean :supper

      t.timestamps
    end
  end
end
