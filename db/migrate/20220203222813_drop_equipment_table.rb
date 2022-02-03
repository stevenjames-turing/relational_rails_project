class DropEquipmentTable < ActiveRecord::Migration[5.2]
  def up 
    drop_table :equipment
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
