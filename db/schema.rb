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

ActiveRecord::Schema[7.1].define(version: 20_240_826_141_741) do
  create_table 'notifications', force: :cascade do |t|
    t.string 'title'
    t.integer 'priority'
    t.integer 'moment'
    t.integer 'phase_id', null: false
    t.text 'messages', default: "--- []\n"
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['phase_id'], name: 'index_notifications_on_phase_id'
  end

  create_table 'phases', force: :cascade do |t|
    t.string 'name'
    t.boolean 'is_first_cycle_logged'
    t.integer 'end'
    t.integer 'start'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['name'], name: 'index_phases_on_name', unique: true
  end

  add_foreign_key 'notifications', 'phases'
end
