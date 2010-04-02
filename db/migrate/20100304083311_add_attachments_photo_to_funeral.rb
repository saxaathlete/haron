class AddAttachmentsPhotoToFuneral < ActiveRecord::Migration
  def self.up
    add_column :funerals, :photo_file_name, :string
    add_column :funerals, :photo_content_type, :string
    add_column :funerals, :photo_file_size, :integer
    add_column :funerals, :photo_updated_at, :datetime
  end

  def self.down
    remove_column :funerals, :photo_file_name
    remove_column :funerals, :photo_content_type
    remove_column :funerals, :photo_file_size
    remove_column :funerals, :photo_updated_at
  end
end
