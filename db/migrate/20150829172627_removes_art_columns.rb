class RemovesArtColumns < ActiveRecord::Migration
  def change
    remove_column :arts, :art_image_file_name, :string
    remove_column :arts, :art_image_content_type, :string
    remove_column :arts, :art_image_file_size, :integer
    remove_column :arts, :art_image_updated_at,:datetime
  end
end
