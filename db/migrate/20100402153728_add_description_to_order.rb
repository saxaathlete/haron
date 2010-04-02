class AddDescriptionToOrder < ActiveRecord::Migration
  def self.up
    remove_column :orders, :first_name_for_receive
    remove_column :orders, :last_name_for_receive
    remove_column :orders, :total_price
    add_column :orders, :message, :text
  end

  def self.down
    add_column :orders, :first_name_for_receive, :string
    add_column :orders, :last_name_for_receive, :string
    add_column :orders, :total_price, :decimal, :default => 0, :scale => 2, :precision => 8
    remove_column :orders, :message
  end
end
