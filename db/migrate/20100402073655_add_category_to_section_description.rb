class AddCategoryToSectionDescription < ActiveRecord::Migration
  def self.up
    add_column :section_descriptions, :category, :string, :null => false
  end

  def self.down
    remove_column :section_descriptions, :category
  end
end
