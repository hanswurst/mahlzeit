class AddMoreDetailsToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :guest, :boolean
    add_column :employees, :number_of_children_level_1, :integer
    add_column :employees, :number_of_children_level_2, :integer
    add_column :employees, :number_of_children_level_3, :integer
    add_column :employees, :default_number_of_meals_adults, :integer
  end
end
