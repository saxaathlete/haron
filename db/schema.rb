# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100412134357) do

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "article"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "directory",  :default => "Новости", :null => false
  end

  create_table "company_informations", :force => true do |t|
    t.text     "information"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", :force => true do |t|
    t.text     "contact"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "galleries", :force => true do |t|
    t.string   "title"
    t.string   "gallery_photo_file_name"
    t.string   "gallery_photo_content_type"
    t.integer  "gallery_photo_file_size"
    t.datetime "gallery_photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  create_table "meny_items", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "controller"
    t.string   "action"
  end

  create_table "orders", :force => true do |t|
    t.text     "address"
    t.string   "email"
    t.string   "telephone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "city"
    t.string   "region"
    t.string   "post_index"
    t.string   "status",      :default => "Новый заказ"
    t.text     "message"
    t.string   "middle_name"
  end

  create_table "product_categories", :force => true do |t|
    t.integer  "parent_id",                                :default => 0
    t.string   "category_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category_type",                            :default => "Monuments", :null => false
    t.string   "category_photo_file_name"
    t.string   "category_photo_content_type"
    t.integer  "category_photo_file_size"
    t.datetime "category_photo_updated_at"
    t.text     "description"
    t.integer  "show_slide",                  :limit => 1, :default => 1,           :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "product_photo_file_name"
    t.string   "product_photo_content_type"
    t.integer  "product_photo_file_size"
    t.datetime "product_photo_updated_at"
    t.string   "category_type",              :default => "Funerals", :null => false
    t.integer  "product_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
  end

end
