class ChangeTopics < ActiveRecord::Migration
  def change
    change_table :topics do |t|
      t.belongs_to :forum
    end
  end
end
