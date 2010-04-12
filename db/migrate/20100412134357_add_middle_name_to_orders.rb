class AddMiddleNameToOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :middle_name, :string
  end

  def self.down
    remove_column :orders, :middle_name
  end
end
