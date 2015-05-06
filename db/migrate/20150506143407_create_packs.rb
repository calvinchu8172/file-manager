class CreatePacks < ActiveRecord::Migration
  def change
    create_table :packs do |t|
      t.string :name, null: false
      t.text :description

      t.timestamps null: false
    end
  end
end
