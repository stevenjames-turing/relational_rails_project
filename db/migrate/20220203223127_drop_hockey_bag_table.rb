class DropHockeyBagTable < ActiveRecord::Migration[5.2]
  def up 
    drop_table :hockey_bags
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
