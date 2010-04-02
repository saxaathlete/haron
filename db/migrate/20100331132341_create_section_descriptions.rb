class CreateSectionDescriptions < ActiveRecord::Migration
  def self.up
    create_table :section_descriptions do |t|
      t.string :title
      t.text :description
      t.string :section_photo_file_name
      t.string :section_photo_content_type
      t.integer :section_photo_file_size
      t.datetime :section_photo_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :section_descriptions
  end
end
