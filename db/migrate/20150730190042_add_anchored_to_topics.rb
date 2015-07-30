class AddAnchoredToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :anchored, :boolean
  end
end
