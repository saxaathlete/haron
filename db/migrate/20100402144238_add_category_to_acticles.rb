class AddCategoryToActicles < ActiveRecord::Migration
  def self.up
    add_column :articles, :directory, :string, :null => false, :default => "Новости"
  end

  def self.down
    remove_column :articles, :category
  end
end
