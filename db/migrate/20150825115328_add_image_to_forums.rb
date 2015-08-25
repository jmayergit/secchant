class AddImageToForums < ActiveRecord::Migration
  def change
    add_column :forums, :image, :string
  end
end
