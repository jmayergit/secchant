class ChangePosts < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.remove :forum_id
      t.belongs_to :topic
    end
  end
end
