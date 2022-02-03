class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.integer :number
      t.boolean :injured
      t.string :name
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
