class AddStatusToOrder < ActiveRecord::Migration
  def self.up
     add_column :orders, :status, :string, :default => "Новый заказ"
  end

  def self.down
    remove_column :orders, :status
  end
end
