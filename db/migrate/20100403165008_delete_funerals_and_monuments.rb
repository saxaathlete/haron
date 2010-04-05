class DeleteFuneralsAndMonuments < ActiveRecord::Migration
  def self.up
    drop_table :funerals
    drop_table :monuments
  end

  def self.down
    create_table :funerals do |t|
      t.integer :artno
      t.string :title
      t.text :description
      t.decimal :price, :default => 0, :scale => 2
      t.timestamps
    end
    create_table :monuments do |t|
      t.integer :artno
      t.string :title
      t.text :description
      t.decimal :price, :default => 0, :scale => 2
      t.timestamps
    end
  end
end
