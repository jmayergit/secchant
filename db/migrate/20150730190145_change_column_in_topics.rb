class ChangeColumnInTopics < ActiveRecord::Migration
  def change
    remove_column :topics, :sticky, :boolean
    add_column :topics, :stickied, :boolean
  end
end
