class CreateMonuments < ActiveRecord::Migration
  def self.up
    create_table :monuments do |t|
      t.integer :artno
      t.string :title
      t.text :description
      t.decimal :price, :default => 0, :scale => 2
      t.timestamps
    end
  end

  def self.down
    drop_table :monuments
  end
end
