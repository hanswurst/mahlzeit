# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130709184331) do

  create_table "employees", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.boolean  "getsMeals"
    t.boolean  "guest"
    t.integer  "number_of_children_level_1"
    t.integer  "number_of_children_level_2"
    t.integer  "number_of_children_level_3"
    t.integer  "default_number_of_meals_adults"
    t.date     "valid_to"
    t.boolean  "breakfast"
    t.boolean  "supper"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "meal_plan_entries", :force => true do |t|
    t.integer  "employee_id"
    t.string   "description"
    t.date     "date"
    t.integer  "number_of_breakfasts"
    t.integer  "number_of_lunches"
    t.integer  "number_of_suppers"
    t.integer  "age_type"
    t.integer  "meal_plan_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "meal_plan_entries", ["employee_id"], :name => "index_meal_plan_entries_on_employee_id"
  add_index "meal_plan_entries", ["meal_plan_id"], :name => "index_meal_plan_entries_on_meal_plan_id"

  create_table "meal_plans", :force => true do |t|
    t.date     "valid_from"
    t.date     "valid_to"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
