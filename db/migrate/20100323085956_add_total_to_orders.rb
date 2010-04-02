class AddTotalToOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :total_price, :decimal, :default => 0, :scale => 2, :precision => 8
  end

  def self.down
    remove_column :orders, :total_price
  end
end
