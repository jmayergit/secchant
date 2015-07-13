class AddTeamForumToForums < ActiveRecord::Migration
  def change
    add_column :forums, :team_forum, :boolean
  end
end
