class AddRepliesToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :replies, :string
  end
end
