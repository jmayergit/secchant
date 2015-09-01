class AddsStoryToArts < ActiveRecord::Migration
  def change
    add_column :arts, :story, :text
  end
end
