class ChangeTopicsTable < ActiveRecord::Migration
  def change
    change_table :topics do |t|
      t.belongs_to :user
    end
  end
end
