# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_04_14_062602) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contents", force: :cascade do |t|
    t.text "business_ideal_customer"
    t.text "business_problem_solved"
    t.string "output_language"
    t.string "content_topic"
    t.integer "topic_quantity"
    t.text "business_customer_subtype"
    t.string "business_customer_subtype_needs"
    t.text "business_customer_subtype_result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
