class DeleteLineItems < ActiveRecord::Migration
  def self.up
    drop_table :line_items
  end

  def self.down
    create_table :line_items do |t|
      t.integer :product_id, :null => false
      t.integer :order_id, :null => false
      t.integer :quantity, :null => false
      t.decimal :price, :null => false, :default => 0, :scale => 2

      t.timestamps
    end
  end
end
