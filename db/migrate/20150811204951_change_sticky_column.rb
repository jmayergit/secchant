class ChangeStickyColumn < ActiveRecord::Migration
  def change
    remove_column :topics, :anchored, :boolen
    add_column :topics, :anchored, :datetime
  end
end
