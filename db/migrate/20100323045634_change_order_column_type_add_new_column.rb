class ChangeOrderColumnTypeAddNewColumn < ActiveRecord::Migration
  def self.up
    remove_column :orders, :name
    add_column :orders, :first_name, :string
    add_column :orders, :last_name, :string
    add_column :orders, :first_name_for_receive, :string
    add_column :orders, :last_name_for_receive, :string
    add_column :orders, :city, :string
    add_column :orders, :region, :string
    add_column :orders, :post_index, :string
  end

  def self.down
    add_column :orders, :name, :string
    remove_column :orders, :first_name
    remove_column :orders, :last_name
    remove_column :orders, :first_name_for_receive
    remove_column :orders, :last_name_for_receive
    remove_column :orders, :city
    remove_column :orders, :region
    remove_column :orders, :post_index
  end
end
