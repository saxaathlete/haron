class CreateProductCategories < ActiveRecord::Migration
  def self.up
    create_table :product_categories do |t|
      t.integer :parent_id, :default => 0
      t.string :category_name
      t.integer :product_id
      t.string :product_type


      t.timestamps
    end
  end

  def self.down
    drop_table :product_categories
  end
end
