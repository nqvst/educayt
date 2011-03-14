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

ActiveRecord::Schema.define(:version => 20110310151230) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "colors", :force => true do |t|
    t.string   "hex"
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "followables", :force => true do |t|
    t.string   "local_type"
    t.integer  "local_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mail_confirmations", :force => true do |t|
    t.integer  "user_id"
    t.string   "confirmation_link"
    t.boolean  "confirmed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications", :force => true do |t|
    t.integer  "updated_object_id"
    t.integer  "user_id"
    t.string   "action"
    t.integer  "followable_id"
    t.boolean  "viewed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "object_types", :force => true do |t|
    t.string   "type_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], :name => "index_relationships_on_follower_id_and_followed_id", :unique => true
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "subcategories", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscriptions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "followable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tutorial_media_types", :force => true do |t|
    t.string   "media_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tutorial_medias", :force => true do |t|
    t.integer  "tutorial_media_type_id"
    t.integer  "tutorial_part_id"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  create_table "tutorial_part_tests", :force => true do |t|
    t.integer  "tutorial_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tutorial_parts", :force => true do |t|
    t.integer  "tutorial_id"
    t.string   "title"
    t.string   "description"
    t.text     "content_text"
    t.integer  "in_order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tutorial_media_id"
  end

  add_index "tutorial_parts", ["tutorial_id"], :name => "index_tutorial_parts_on_tutorial_id"

  create_table "tutorials", :force => true do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "subcategory_id"
  end

  add_index "tutorials", ["user_id"], :name => "index_tutorials_on_user_id"

  create_table "updated_objects", :force => true do |t|
    t.string   "object_type_id"
    t.integer  "local_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
    t.string   "provider"
    t.string   "uid"
    t.string   "bio",                :limit => nil
    t.boolean  "admin",                             :default => false
    t.string   "activation_code"
    t.boolean  "activated",                         :default => false, :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
