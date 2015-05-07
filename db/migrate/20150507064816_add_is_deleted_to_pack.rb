class AddIsDeletedToPack < ActiveRecord::Migration
  def change
    add_column :packs, :is_deleted, :boolean, default: false
  end
end
