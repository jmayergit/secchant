class AddsDefaultToBanned < ActiveRecord::Migration
  def change
    change_column_default :users, :banned, :false
  end
end
