class AddDescriptionToProductCategories < ActiveRecord::Migration
  def self.up
    remove_column :product_categories, :description
    add_column :product_categories, :description, :text
    add_column :product_categories, :show_slide, :integer, :limit => 1, :null => false, :default => 1
  end

  def self.down
    remove_column :product_categories, :description
    remove_column :product_categories, :show_slide
  end
end
