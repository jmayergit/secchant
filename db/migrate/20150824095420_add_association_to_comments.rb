class AddAssociationToComments < ActiveRecord::Migration
  def change
    change_table :comments do |t|
      t.belongs_to :art
    end
  end
end
