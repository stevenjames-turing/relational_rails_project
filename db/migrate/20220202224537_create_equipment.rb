class CreateEquipment < ActiveRecord::Migration[5.2]
  def change
    create_table :equipment do |t|
      t.integer :count
      t.boolean :protective
      t.string :brand
      t.references :hockey_bag, foreign_key: true

      t.timestamps
    end
  end
end
