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

ActiveRecord::Schema.define(version: 20170305214001) do

  create_table "avatars", force: :cascade do |t|
    t.string   "name"
    t.string   "element"
    t.integer  "hp",          default: 20
    t.integer  "level",       default: 5
    t.integer  "exp",         default: 0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "job_id"
    t.integer  "MaxHealth",   default: 20
    t.integer  "force",       default: 5
    t.integer  "agility",     default: 5
    t.integer  "inteligence", default: 5
    t.index ["job_id"], name: "index_avatars_on_job_id"
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
    t.string   "name"
    t.integer  "level"
    t.integer  "nbMonster"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "name"
    t.integer  "agility"
    t.integer  "strong"
    t.integer  "intelligence"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "monsters", force: :cascade do |t|
    t.string   "name"
    t.integer  "hp"
    t.integer  "force"
    t.integer  "agility"
    t.integer  "exp"
    t.string   "element"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "inteligence"
  end

  create_table "objets", force: :cascade do |t|
    t.string  "name"
    t.integer "rarity"
    t.integer "health"
    t.integer "force"
    t.integer "agility"
    t.integer "magic"
    t.string  "category"
  end

end
