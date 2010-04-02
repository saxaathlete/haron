class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.integer :artno
      t.string :title
      t.text :description
      t.decimal :price, :default => 0, :scale => 2
      t.string :product_photo_file_name
      t.string :product_photo_content_type
      t.integer :product_photo_file_size
      t.datetime :product_photo_updated_at
      t.string :category_type, :default => ProductCategory::Type::FUNERALS, :null => false
      t.integer  :product_category_id
      t.timestamps
  
    end
  end

  def self.down
    drop_table :products
  end
end
