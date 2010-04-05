class RemovePriceAndArtnoFrom < ActiveRecord::Migration
  def self.up
    remove_column :products, :artno
    remove_column :products, :price
  end

  def self.down
    add_column :products, :artno, :integer
    add_column :products, :price, :decimal, :default => 0, :scale => 2
  end
end
