class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.integer :roster
      t.boolean :coach
      t.string :league

      t.timestamps
    end
  end
end
