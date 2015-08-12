class ChangeStickiedColumn < ActiveRecord::Migration
  def change
    change_column :topics, :stickied, :boolean, null: false, default: false
    remove_column :topics, :anchored, :datetime
    add_column :topics, :anchored, :boolean, null: false, default: false
    change_column :topics, :last_post_created_at, :datetime
  end
end
