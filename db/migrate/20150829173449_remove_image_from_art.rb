class RemoveImageFromArt < ActiveRecord::Migration
  def change
    remove_column :arts, :image, :string
  end
end
