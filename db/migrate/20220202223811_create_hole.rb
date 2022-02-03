class CreateHole < ActiveRecord::Migration[5.2]
  def change
    create_table :holes do |t|
      t.boolean :hazard
      t.string :pin_location
      t.integer :par
      t.references :golf_course, foreign_key: true

      t.timestamps
    end
  end
end
