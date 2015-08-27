class ChangeModColumn < ActiveRecord::Migration
  def change
    change_column :users, :moderator, :boolean, default: false
  end
end
