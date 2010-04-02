class CreateGalleries < ActiveRecord::Migration
  def self.up
    create_table :galleries do |t|
      t.string :title
      t.string :gallery_photo_file_name
      t.string :gallery_photo_content_type
      t.integer :gallery_photo_file_size
      t.datetime :gallery_photo_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :galleries
  end
end
