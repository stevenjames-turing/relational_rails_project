class CreateHockeyBag < ActiveRecord::Migration[5.2]
  def change
    create_table :hockey_bags do |t|
      t.string :player
      t.integer :pockets
      t.boolean :stinky

      t.timestamps
    end
  end
end
