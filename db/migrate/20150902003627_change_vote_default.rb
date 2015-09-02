class ChangeVoteDefault < ActiveRecord::Migration
  def change
    change_column_default :posts, :downvotes, 0
    change_column_default :posts, :upvotes, 0
  end
end
