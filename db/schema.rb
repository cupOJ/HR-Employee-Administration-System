ActiveRecord::Schema.define(version: 2022_02_02_022348) do

  create_table "divisions", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "manager_id"
    t.index ["manager_id"], name: "index_divisions_on_manager_id", unique: true
  end

  create_table "employees", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "job"
    t.float "salary"
    t.integer "employment_status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "team_id"
    t.index ["team_id"], name: "index_employees_on_team_id"
  end

  create_table "targets", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.date "start_date"
    t.date "finish_date"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "team_id"
    t.index ["team_id"], name: "index_targets_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "division_id"
    t.integer "team_lead_id"
    t.index ["division_id"], name: "index_teams_on_division_id"
    t.index ["team_lead_id"], name: "index_teams_on_team_lead_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "divisions", "employees", column: "manager_id"
  add_foreign_key "employees", "teams"
  add_foreign_key "targets", "teams"
  add_foreign_key "teams", "divisions"
  add_foreign_key "teams", "employees", column: "team_lead_id"
end
