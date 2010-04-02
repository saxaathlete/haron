class CreateFunerals < ActiveRecord::Migration
  def self.up
    create_table :funerals do |t|
      t.integer :artno
      t.string :title
      t.text :description
      t.decimal :price, :default => 0, :scale => 2
      t.timestamps
    end
  end

  def self.down
    drop_table :funerals
  end
end
