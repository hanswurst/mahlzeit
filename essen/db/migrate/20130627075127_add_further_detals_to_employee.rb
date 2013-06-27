class AddFurtherDetalsToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :breakfast, :boolean
    add_column :employees, :supper, :boolean
  end
end
