class AddsFaveTeamToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fave_team, :string, array: true, default: ["none",""]
  end
end
