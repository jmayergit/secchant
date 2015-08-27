class AddImageToArts < ActiveRecord::Migration
  def change
    add_column :arts, :image, :binary
  end
end
