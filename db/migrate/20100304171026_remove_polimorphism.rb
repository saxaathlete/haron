class RemovePolimorphism < ActiveRecord::Migration
  def self.up
    remove_column :product_categories, :product_id
    remove_column :product_categories, :product_type
    add_column :product_categories, :category_type, :string, :default => ProductCategory::Type::MONUMENTS, :null => false
    add_column :monuments, :product_category_id, :integer
    add_column :funerals, :product_category_id, :integer
  end

  def self.down
    add_column :product_categories, :product_id, :integer
    add_column :product_categories, :product_type, :integer
    remove_column :product_categories, :category_type
    remove_column :monuments, :product_category_id
    remove_column :funerals, :product_category_id
  end
end
