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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170312172633) do

  create_table "avatars", force: :cascade do |t|
    t.string  "name"
    t.string  "element"
    t.integer "hp",              default: 20
    t.integer "level",           default: 1
    t.integer "exp",             default: 0
    t.integer "job_id"
    t.integer "MaxHealth",       default: 20
    t.integer "force",           default: 5
    t.integer "agility",         default: 5
    t.integer "inteligence",     default: 5
    t.integer "user_id"
    t.integer "id_objet_equipe"
    t.index ["job_id"], name: "index_avatars_on_job_id"
    t.index ["user_id"], name: "index_avatars_on_user_id"
  end

  create_table "bag_monsters", force: :cascade do |t|
    t.integer "monster_id"
    t.integer "objet_id"
    t.index ["monster_id"], name: "index_bag_monsters_on_monster_id"
    t.index ["objet_id"], name: "index_bag_monsters_on_objet_id"
  end

  create_table "bags", force: :cascade do |t|
    t.integer "avatar_id"
    t.integer "objet_id"
    t.index ["avatar_id"], name: "index_bags_on_avatar_id"
    t.index ["objet_id"], name: "index_bags_on_objet_id"
  end

  create_table "donjons", force: :cascade do |t|
    t.string  "name"
    t.integer "level"
  end

  create_table "jobs", force: :cascade do |t|
    t.string  "name"
    t.integer "agility"
    t.integer "strong"
    t.integer "intelligence"
  end

  create_table "mirs", force: :cascade do |t|
    t.integer "room_id"
    t.integer "monster_id"
    t.index ["monster_id"], name: "index_mirs_on_monster_id"
    t.index ["room_id"], name: "index_mirs_on_room_id"
  end

  create_table "monsters", force: :cascade do |t|
    t.string  "name"
    t.integer "hp"
    t.integer "force"
    t.integer "agility"
    t.integer "exp"
    t.string  "element"
    t.integer "inteligence"
  end

  create_table "objets", force: :cascade do |t|
    t.string  "name"
    t.integer "rarity"
    t.integer "health"
    t.integer "force"
    t.integer "agility"
    t.integer "magic"
    t.string  "category"
    t.string  "description"
  end

  create_table "oirs", force: :cascade do |t|
    t.integer "objet_id"
    t.integer "room_id"
    t.index ["objet_id"], name: "index_oirs_on_objet_id"
    t.index ["room_id"], name: "index_oirs_on_room_id"
  end

  create_table "rids", force: :cascade do |t|
    t.integer "room_id"
    t.integer "donjon_id"
    t.index ["donjon_id"], name: "index_rids_on_donjon_id"
    t.index ["room_id"], name: "index_rids_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "username",               default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "avatar_id"
    t.string   "role"
    t.index ["avatar_id"], name: "index_users_on_avatar_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
