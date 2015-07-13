class ChangeTeamForumDefaultOnForums < ActiveRecord::Migration
  def change
    change_column_default :forums, :team_forum, false
  end
end
