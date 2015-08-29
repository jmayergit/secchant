class ChangeImageColumn < ActiveRecord::Migration
  def change
    change_column :arts, :image, :string
  end
end
