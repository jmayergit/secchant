class AddArtImageToArt < ActiveRecord::Migration
  def change
    add_attachment :arts, :art_image
  end
end
