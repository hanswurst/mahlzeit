class AddDetailsToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :valid_to, :date
  end
end
