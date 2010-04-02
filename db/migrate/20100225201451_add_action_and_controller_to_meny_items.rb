class AddActionAndControllerToMenyItems < ActiveRecord::Migration
  def self.up
    add_column :meny_items, :controller, :string
    add_column :meny_items, :action, :string
  end

  def self.down
    add_column :meny_items, :action
    add_column :meny_items, :controller
  end
end
