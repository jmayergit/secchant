class AddSubjectToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :subject, :string
  end
end
