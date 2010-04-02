class CreateMenyItems < ActiveRecord::Migration
  def self.up
    create_table :meny_items do |t|
      t.string :name
      
      t.timestamps
    end
  end

  def self.down
    drop_table :meny_items
  end
end
