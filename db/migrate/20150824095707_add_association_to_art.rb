class AddAssociationToArt < ActiveRecord::Migration
  def change
    change_table :arts do |t|
      t.belongs_to :admin
    end
  end
end
