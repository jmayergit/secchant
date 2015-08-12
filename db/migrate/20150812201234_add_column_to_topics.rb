class AddColumnToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :last_post_created_at, :datetime
  end
end
